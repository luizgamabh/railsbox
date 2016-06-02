# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "D:/Web/www.vagrant", "/var/www/html/"
  # config.vm.synced_folder "D:\\Web\\www\\ufmg", "/ufmg/"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "8192"
  end

  config.berkshelf.enabled = true
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

config.vm.provision :chef_solo do |chef|
    # chef.version = "12.11.11"
    chef.version = "12.10.40"
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "htop"
    chef.add_recipe "curl"
    chef.add_recipe "zlib"
    chef.add_recipe "java"
    chef.add_recipe "elasticsearch"
    chef.add_recipe "build-essential"
    chef.add_recipe "nodejs-setup"
    chef.add_recipe "ruby_build"
    # chef.add_recipe "rvm::user_install"
    chef.add_recipe "rvm::user"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "vim"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "imagemagick"
    chef.add_recipe "imagemagick::devel"
    # chef.add_recipe "imagemagick::rmagick"
    chef.add_recipe "redisio"
    chef.add_recipe "redisio::install"
    chef.add_recipe "redisio::enable"
    chef.add_recipe "xml"
    chef.add_recipe "custombox"
    # chef.add_recipe "thumbor"

    chef.json = {
      "java": {
        "install_flavor": "openjdk",
        "jdk_version": "7"
      },
      "nodejs-setup": {
        "version": "5.x"
      },
      "rvm": {
        "user_installs": [
          {
            "user": "vagrant",
            "default_ruby": "2.2.4",
            "rubies": [
              "2.2.4",
              "1.9.3"
            ],
            "rvm_gem_options": "--no-ri --no-rdoc",
            "global_gems": [
              {
                "name": "bundler"
              },
              {
                "name": "sass"
              },
              {
                "name": "compass"
              }
            ]
          }
        ]
      },
      "mysql": {
        "version": "5.5",
        "server_root_password": "",
        "bind_address": "0.0.0.0",
        "port": "3306"
      },
      "redis": {
        "server": {
          "run_state": "start"
        }
      },
      "postgresql": {
        "password": {
          "postgres": "@r00t@"
        }
      }
      # "thumbor": {
      #   "key": "AlexTsiprasSaysN0MoreAusterity",
      #   "options": {
      #     "QUALITY": 90,
      #     "ALLOW_UNSAFE_URL": false,
      #     "MAX_AGE": 2592000,
      #     "UPLOAD_ENABLED": true,
      #     "UPLOAD_PHOTO_STORAGE": true,
      #     "STORAGE": "thumbor.storages.file_storage",
      #     "FILE_STORAGE_ROOT_PATH": "/var/storage/thumbor/files",
      #     "RESULT_STORAGE_FILE_STORAGE_ROOT_PATH": "/var/storage/thumbor/result/",
      #     "RESULT_STORAGE_STORES_UNSAFE": false,
      #     "ENGINE": "opencv",
      #     "DETECTORS": [
      #       "thumbor.detectors.queued_detector.queued_complete_detector"
      #     ]
      #   }
      # }
    }

  end
  
end