#!/bin/sh

apt update && apt upgrade -y

sudo add-apt-repository ppa:ondrej/php -y

apt update && apt upgrade -y

echo Install apache2 and PHP8.0
apt install apache2 php8 libapache2-mod-php8.0 php8.0-fpm libapache2-mod-fcgid -y
apt install apache2 php8.0 libapache2-mod-php8.0 php8.0-fpm libapache2-mod-fcgid php8.0-gd -y

echo Enable apache2 modules
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
sudo a2enmod headers
sudo a2enmod rewrite

echo Enable apache2 SSL
sudo a2enmod ssl

mkdir /var/log/apache2/products/

echo Restart apache2
sudo systemctl restart apache2