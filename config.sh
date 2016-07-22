#!/bin/bash
#
# Update machine
sudo yum -y update
sudo yum -y upgrade
#
# Install Apache
sudo yum -y install httpd
sudo chkconfig --levels 235 httpd on
sudo /etc/init.d/httpd start
#
# Install MySQL
# sudo yum -y install http://dev.mysql.com/get/mysql57-community-release-el6-8.noarch.rpm
# sudo yum -y install mysql-community-server
sudo yum -y install mysql mysql-server
sudo chkconfig --levels 235 mysqld on
sudo /etc/init.d/mysqld start
sudo /usr/bin/mysqladmin -u root password 'samplepass'
#
# Install php
sudo yum -y install php php-common php-mysql
#
# Install phpMyAdmin
sudo yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum -y install phpmyadmin
#
# Install WordPress
cd /tmp
sudo wget http://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz -C /var/www/html
