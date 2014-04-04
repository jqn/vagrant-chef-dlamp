module.exports = function(grunt) {

  // Initialize global configuration variables.
  var config = grunt.file.readJSON('config.json');
  grunt.initConfig({
    config: config
  });

  /**
   * Define "behat" tasks.
   *
   * Dynamically adds Behat testing tasks based on configuration sets in the
   * package.json file.
   *
   * Example:
   *   "config": {
   *     "docroot": "/var/www/vhosts/dev-site.local",
   *     "site_urls": {
   *       default: http://dev-site.local"
   *     }
   *   }
   */
  grunt.loadNpmTasks('grunt-parallel-behat');
  if (config.docroot && config.siteUrls) {
    for (var key in config.siteUrls) {
      if (config.siteUrls.hasOwnProperty(key)) {
        grunt.config(['behat', 'site-' + key], {
          src: './features/*.feature',
          config: './behat.yml',
          maxProcesses: 5,
          bin: './bin/behat',
          flags: '',
          env: {
            "BEHAT_PARAMS": "extensions[Drupal\\DrupalExtension\\Extension][drupal][drupal_root]=" + config.docroot,
            "MINK_EXTENSION_PARAMS": "base_url=" + config.siteUrls[key]
          }
        });
      }
    }
  }

  /**
   * Define "watch" tasks.
   *
   * Add a watch task that automatically runs the test suite when a file in
   * the Drupal docroot changes (except for files in sites/.../files) or when
   * a file in the testing features directory changes.
   */
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.config('watch', {
    files: [
      '<%= config.docroot %>/**/*',
      '!<%= config.docroot %>/sites/*/files/**/*',
      'features/**/*'
    ],
    tasks: ['behat']
  });

  // Define the default task to fully build and configure the project.
  var tasksDefault = [];
  if (grunt.config.get('behat')) {
    tasksDefault.push('behat');
  }
  grunt.registerTask('default', tasksDefault);

};
