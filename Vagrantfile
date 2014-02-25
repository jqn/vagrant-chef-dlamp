Vagrant.configure("1") do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  # config.vm.boot_mode = :gui

  # Memory setting for Vagrant < 0.90
  # config.vm.customize do |vm|
  #   vm.memory_size = 1024
  # end

  # Memory setting for Vagrant >= 0.90
  config.vm.customize ["modifyvm", :id, "--memory", "1024"]

  # Network setting for Vagrant < 0.90
  # config.vm.network("10.0.0.10")

  # Network setting for Vagrant >= 0.90
  config.vm.network :hostonly, "10.0.0.10"
  config.vm.forward_port(3306, 3306)

  # Try to use NFS only on platforms other than Windows
  nfs = !Kernel.is_windows?
  config.vm.share_folder("vagrant-root", "/vagrant", ".", :nfs => nfs)
  config.vm.share_folder("docroot", "/var/www/vhosts/dev-site.local", "docroot", :nfs => nfs)
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/docroot", "1"]
  config.vm.share_folder("framework", "/opt/testing_framework", "framework", :nfs => nfs)
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/framework", "1"]

  config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/site-cookbooks", "cookbooks/drupal-cookbooks", "cookbooks/bdd-cookbooks"]

    chef.add_recipe("vim")
    
    chef.roles_path = "roles"
   
    # This role represents our default Drupal development stack.
    chef.add_role("drupal_lamp_dev_bdd")

    chef.json.merge!({
        :www_root => '/var/www/vhosts/dev-site.local',
        :mysql => {
          :server_root_password => "root", # TODO Hardcoded MySQL root password.
          :allow_remote_root => true,
          :bind_address => "0.0.0.0"
        },
        :hosts => {
          :localhost_aliases => ["dev-site.local"]
        },
        :drush => {
          :install_method => 'pear',
          :version => '5.8.0',
        }
      })
  end
end

# Returns true if we are running on a MS windows platform, false otherwise.
def Kernel.is_windows?
  processor, platform, *rest = RUBY_PLATFORM.split("-")
  platform == 'mswin32' || platform == 'mswin64' || platform == 'mingw32' || platform == 'mingw32'
end
