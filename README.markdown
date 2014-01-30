# What
VirtualBox Vagrant Chef Drupal install


# How
1. Download and Install [VirtualBox](http://www.virtualbox.org/) (ensure you are on the latest version 4.0.8+)
1. Install [vagrant](http://vagrantup.com/v1/docs/getting-started/index.html)
1. Clone this project into a new directory.
1. Create a subdirectory (or symlink to a directory) called "docroot" that includes the Drupal installation.
1. Launch the Vagrant box:
    `vagrant up`
1. Add this line to your /etc/hosts (or windows equivalent):
    `10.0.0.10        dev-site.local`

That's it, files in "docroot" are served here: [http://dev-site.local/](http://dev-site.local/)

To connect to the console of you instance:
    `vagrant ssh` 

The MySQL root username/password is: root/root


# Why
This project is based on the [Vagrant Project](http://drupal.org/project/vagrant) on Drupal.org, but includes a number of tweaks.

1. Instead of provisioning a Drupal site using Chef, it simply sets up Apache to serve incoming requests from the shared Vagrant public directory. It assumes that you'll be maintaining one VM for each simulated multisite instance.
2. It doesn't install PHPMyadmin, because that makes baby Jesus cry. If you need to poke at the DB, use a tool like [Sequel Pro](http://www.sequelpro.com/), and log into the DB over the Vagrant SSH connection.
3. It installs Drush 5.7 via PEAR instead of a custom Chef recipe. Because lazy.

--------

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug profile, e.g. [http://dev-site.vbox.local/?XDEBUG_PROFILE](http://dev-site.vbox.local/?XDEBUG_PROFILE)

You can then investigate at [http://dev-site.local/webgrind/](http://dev-site.local/webgrind/)


## Other projects of interest

*  [https://github.com/msonnabaum/drupalcon-training-chef-repo](https://github.com/msonnabaum/drupalcon-training-chef-repo)
*  [http://drupal.org/sandbox/mbutcher/1356522](http://drupal.org/sandbox/mbutcher/1356522)
*  [http://drupal.org/project/drush-vagrant](http://drupal.org/project/drush-vagrant)
