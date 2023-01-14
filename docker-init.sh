#!/bin/bash

DQ_LOADED=$(which ssh) 
[ $DQ_LOADING ] && exit 1
if [ -z $DQ_LOADING ]; then # stops extra calls while loading but would not prevent script from running again after restart
DQ_LOADING='LOADING'

if [ -z $DQ_LOADED ]; then # prevents script from running again after restart
# sudo su -

echo "installing dev utils"
apt-get update && apt-get install -y \
    curl  g++  git  libbz2-dev  libfreetype6-dev \
    libicu-dev libjpeg-dev libmcrypt-dev libpng-dev \
    libreadline-dev libwebp-dev  libzip-dev \
    sudo unzip vim zip

echo "enabling sll"
a2enmod ssl

echo "installing mysqli"
docker-php-ext-install mysqli && docker-php-ext-enable mysqli

echo "restarting server so installations can take effect"
service apache2 restart
exit 1
fi fi

[ $DQ_LOADED ] && exit 1
echo "dq apache server initialized"