
# Workaround to execute npm install in tmp is necessary with NFS + Vagrant to
# avoid file permission issues. See: https://github.com/npm/npm/issues/3565
execute "/bin/rm -rf /tmp/tmp_framework ; /bin/cp -rf /vagrant/framework/ /tmp/tmp_framework"

grunt_cookbook_npm "/tmp/tmp_framework" do
  action :install
end

execute "/bin/cp -rf /tmp/tmp_framework/* /vagrant/framework ; /bin/rm -rf /tmp/tmp_framework"

include_recipe "composer::install"

composer_project "/vagrant/framework" do
  dev true
  quiet true
  action :update
end
