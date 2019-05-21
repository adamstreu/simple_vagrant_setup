# -*- mode: ruby -*-

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yml")
sfi            = configs['configs']['starting_forward_ip']
base_box       = configs['configs']['base_box']

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

  config.vm.define "ansible1" do |ansible1|
    ansible1.vm.box = base_box
    ansible1.vm.hostname = "ansible1"
    ansible1.vm.network "private_network", ip: "10.101.0.2"
    ansible1.vm.network "forwarded_port", guest: 80, host: sfi + 0
    ansible1.vm.provision "shell", inline: $install_ansible
  end

  config.vm.define "ansible2" do |ansible2|
    ansible2.vm.box = base_box
    ansible2.vm.hostname = "ansible2"
    ansible2.vm.network "private_network", ip: "10.101.0.3"
    ansible2.vm.network "forwarded_port", guest: 80, host: sfi + 1
  end

  config.vm.define "ansible3" do |ansible3|
    ansible3.vm.box = base_box
    ansible3.vm.hostname = "ansible3"
    ansible3.vm.network "private_network", ip: "10.101.0.4"
    ansible3.vm.network "forwarded_port", guest: 80, host: sfi + 2
  end

end


