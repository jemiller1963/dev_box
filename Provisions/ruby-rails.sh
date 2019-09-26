#!/usr/bin/env bash
# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

echo updating package information
apt-get -y update >/dev/null 2>&1
apt-get dist-upgrade -y >/dev/null 2>&1

echo "Installing Git"
apt-get install git -yq

echo "Installing pg packages"
# this package is required to pg to work
apt-get install libpq-dev -yq

echo "Installing Ruby"
install Ruby ruby-full
ruby -v

echo "Installing Dev Tools"
install 'development tools' build-essential autoconf libtool

echo Installing current RubyGems
gem update --system -N >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

echo installing Rails
gem install rails -v 5.2.1

rails -v

echo "installing memcached and Redis"

install memcached memcached
install Redis redis-server


printf "===== Install Heroku Toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo 'all set, rock on!'