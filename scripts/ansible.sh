!#/bin/bash

echo I am installing ansible...
sudo apt-get install software-properties-common -y
udo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
