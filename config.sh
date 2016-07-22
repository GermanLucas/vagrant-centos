#!/bin/bash
#
# Si queremos actualizar la maquina
# sudo yum -y update
# sudo yum -y upgrade
#
# Instalacion Apache
echo "*****************************************************"
echo "Install Apache"
echo "*****************************************************"
sudo yum -y install httpd
sudo chkconfig --levels 235 httpd on
sudo /etc/init.d/httpd start
#
# Instalacion MySQL
echo "*****************************************************"
echo "Install MySQL"
echo "*****************************************************"
sudo yum -y install mysql mysql-server
sudo chkconfig --levels 235 mysqld on
sudo /etc/init.d/mysqld start
#
# Creacion nuevo usuario, borrando el usuario creado por defecto
echo "*****************************************************"
echo "Create new user MySQL"
echo "*****************************************************"
sudo mysql -e "CREATE USER 'sqladmin'@'localhost' IDENTIFIED BY 'samplepass'"
sudo mysql -e "GRANT ALL ON *.* TO 'sqladmin'@'localhost'"
sudo mysql -e "FLUSH PRIVILEGES"
sudo mysql -e "DROP USER 'root'@'localhost'"
#
# Instalacion php
echo "*****************************************************"
echo "Install php"
echo "*****************************************************"
sudo yum -y install php php-common php-mysql
#
# Instalacion phpMyAdmin
echo "*****************************************************"
echo "Install phpMyAdmin"
echo "*****************************************************"
sudo yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum -y install phpmyadmin
#
# Instalacion WordPress
echo "*****************************************************"
echo "Install WordPress"
echo "*****************************************************"
cd /tmp
sudo wget http://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz -C /var/www/html
