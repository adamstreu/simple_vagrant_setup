i# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yml")
sfi            = configs['configs']["starting_forward_ip"]



$install_ansible = <<-SCRIPT
echo I am installing ansible...
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
SCRIPT





$provision_user_space = <<-SCRIPT
# sudo echo "PS1=\\e[38\\;5\\;220m\\n\\u@\\h:\\w > \\e[38\\;5\\;015m" >> /home/vagrant/.bashrc 
# sudo echo "PS1=\\e[38\\;5\\;009m\\n\\u@\\h:\\w >\\e[38\\;5\\;015m" >> /.bashrc 
echo nothing
SCRIPT

Vagrant.configure("2") do |config| 

  config.vm.define "box1" do |box1|
    box1.vm.box = "ubuntu/bionic64"
    box1.vm.network "private_network", ip: "10.101.0.2"
    box1.vm.network "forwarded_port", guest: 80, host: sfi + 0
    box1.vm.provision "shell", inline: $provision_user_space 
  end

  config.vm.define "box2" do |box2|
    box2.vm.box = "ubuntu/bionic64"
    box2.vm.network "private_network", ip: "10.101.0.3"
    box2.vm.network "forwarded_port", guest: 80, host: sfi + 1
    box2.vm.provision "shell", inline: $provision_user_space 
  end

  config.vm.define "box2" do |box3|
    box3.vm.box = "ubuntu/bionic64"
    box3.vm.network "private_network", ip: "10.101.0.4"
    box3.vm.network "forwarded_port", guest: 80, host: sfi + 2
    box3.vm.provision "shell", inline: $provision_user_space 
  end

end

  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
