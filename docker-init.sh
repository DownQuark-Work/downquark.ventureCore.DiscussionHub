#!/bin/bash
# docker exec -it --user root apache-php /bin/bash
# sh /var/run/dq-init.sh

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

echo "find a better way - this was way too much that you don't need"
apt-get install mariadb-server

echo "enabling sll"
a2enmod ssl

echo "installing mysqli"
docker-php-ext-install mysqli && docker-php-ext-enable mysqli
docker-php-ext-install pdo_mysql
docker-php-ext-install gd intl bcmath calendar zip

echo "restarting server so installations can take effect"
service apache2 restart
exit 1
fi fi

[ $DQ_LOADED ] && exit 1
echo "dq apache server initialized"