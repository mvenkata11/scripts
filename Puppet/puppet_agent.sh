#!/bin/bash
sudo yum install -y wget
echo "=================================="
echo "installing java 8"
echo "=================================="
sudo yum install java-1.8.0-openjdk -y
echo "=================================="
echo "downloading puppet repository"
echo "=================================="
sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
echo "=================================="
echo "updating the repositories"
echo "=================================="
sudo yum update -y
echo "=================================="
echo "installing puppet"
echo "=================================="
sudo yum install puppet-agent -y
echo "=================================="
echo "changing the hostname"
echo "=================================="
sudo hostnamectl set-hostname agent
echo "=================================="
echo "adding puppet master ip to hosts file of puppet agent"
echo "=================================="
sudo sed -i "4i10.123.1.7     puppet" /etc/hosts 
echo "=================================="
echo "sending certificate to master"
echo "=================================="
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
