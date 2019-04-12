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
sudo yum install puppetserver -y
echo "=================================="
echo "changing the hostname"
echo "=================================="
sudo hostnamectl set-hostname puppet
echo "=================================="
echo "changing the memory allocation to 512mb"
echo "=================================="
sudo sed -i 's/-Xms2g/-Xms512m/g' /etc/sysconfig/puppetserver
sudo sed -i 's/-Xmx2g/-Xmx512m/g' /etc/sysconfig/puppetserver
echo "=================================="
echo "starting and enabling puppetserver"
echo "=================================="
sudo systemctl start puppetserver
sudo systemctl enable puppetserver