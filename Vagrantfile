# -*- mode: ruby -*-

require 'yaml'
current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yml")
hosts          = configs['hosts']
base_box       = configs['base_box'] 


Vagrant.configure("2") do |config|
  hosts.each do |host|
    config.vm.define host['name'] do |node|
      node.vm.box = 'ubuntu/bionic64'
    end
  end
end
