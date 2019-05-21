# -*- mode: ruby -*-

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yml")
sfi            = configs['configs']['starting_forward_ip']

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
    box1.vm.box = "adam4"
    box1.vm.network "private_network", ip: "10.101.0.2"
    box1.vm.network "forwarded_port", guest: 80, host: sfi + 0
    box1.vm.provision "shell", inline: $provision_user_space 
  end

  config.vm.define "box2" do |box2|
    box2.vm.box = "adam4"
    box2.vm.network "private_network", ip: "10.101.0.3"
    box2.vm.network "forwarded_port", guest: 80, host: sfi + 1
    box2.vm.provision "shell", inline: $provision_user_space 
  end

  config.vm.define "box2" do |box3|
    box3.vm.box = "adam4"
    box3.vm.network "private_network", ip: "10.101.0.4"
    box3.vm.network "forwarded_port", guest: 80, host: sfi + 2
    box3.vm.provision "shell", inline: $provision_user_space 
  end

end


