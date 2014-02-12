# What
VirtualBox Vagrant Chef BDD install


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


# BDD Project Specifics

## Important Info

- Tech Lead: Nate Swart (nate.swart - at - acquia - dot - com)
- [bit.ly/nateschedule](http://bit.ly/nateschedule) - If you want to sync up with Nate (Tech Lead for this project) check out his availability and send a meeting request.
- [Chef cookbooks planning](https://docs.google.com/a/acquia.com/spreadsheet/ccc?key=0AoTh4e7y4GWPdFlXSkw0Z0dJMnlHNmdraUxKbXhhT3c#gid=0)

## Basic Methodology

We're adding cookbooks to this repo as needed to help spin up various combinations of testing stacks. Each person involved can leverage cookbooks added by others and add any missing cookbooks needed for their workflow. The idea is that you can then create a Role that will piece together the cookbooks to create an environment that you can use for BDD. Ultimately, there will be a wide variety of roles to choose from depending on if you want:

- completely local testing
- integration with third party services such as SauceLabs, Github, etc
- heavier-full featured stack using technologies such as Jenkins
- lighter stack leveraging tools like grunt.js, casper.js, etc.
