#!/bin/bash
service mysql start
service php7.3-fpm start
service nginx start
mysql -e "create database mspinnet_site;"
mysql -e "create user mspinnet;"
mysql -e "grant all on mspinnet_site.* to 'mspinnet'@'localhost' identified by 'password';"
mysql -e "flush privileges;"
bash