Drupal Testing Framework
===

Dependencies
---

1. npm
   Obtain by installing Node.js.

1. Grunt CLI
   Install by running: npm install grunt-cli --global

1. Composer
   Install by running: curl -sS https://getcomposer.org/installer | php


Getting started
---

1. To install dependencies, run "npm install" and "php composer.phar install" in the project directory where package.json is located.

1. Update config.json if your Drupal docroot is not located at /var/www/vhosts/dev-site.local or not accessible at http://dev-site.local.

1. Run "grunt" to execute all tests or use "grunt watch" to watch for file changes and run automatically.


Extending
---

Create additional Behat test features and scenarios in the features directory.
