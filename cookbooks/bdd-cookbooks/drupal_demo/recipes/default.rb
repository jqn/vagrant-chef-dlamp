
drush_execute "pm-download" do
  cwd "/vagrant"
  options %W{ drupal --drupal-project-rename="docroot" }
end

drush_execute "site-install" do
  cwd "/vagrant/docroot"
  options %W{ --account-name=admin --account-pass=admin --db-su=root --db-su-pw=root --db-url=mysql://drupaldemo:drupaldemo@localhost/drupaldemo }
end
