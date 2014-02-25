
drush_execute "pm-download" do
  cwd "/vagrant"
  options %W{drupal --drupal-project-rename="docroot" }
end

execute "clean-yum-cache" do
  cwd "/vagrant/docroot"
  command "chmod -R #node[:apache][:user]:#node[:apache][:group] *"
  action :nothing
end
