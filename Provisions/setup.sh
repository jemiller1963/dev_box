#!/usr/bin/env bash

printf "\n****Provisioning virtual machine..."

# printf "\n****Updating apt-get\n"
# sudo apt-get update -yq && sudo apt-get dist-upgrade -yq

printf "\n****Installing core tools"
sudo apt-get install git-core curl zlib1g-dev libssl-dev libxml2 libxml2-dev libxslt1-dev -yq
sudo apt-get install libgtkmm-3.0-1 libnotify4 libraw1394-11 libgtk2.0-0 libgtkmm-2.4-dev libglademm-2.4-dev libgtkglextmm-x11-1.2-dev libusb-1.0-0 -yq

# printf "\n****Installing Git"
# apt-get install git -yq

##
# ZSH
##
printf "\n========== Installing zsh ==============="
# Install zsh
apt-get install -y -q zsh
printf "\n========== Done ===============\n"
printf "\n========== Installing oh-my-zsh ==============="
# Clone oh-my-zsh
if [ ! -d ~vagrant/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~vagrant/.oh-my-zsh
fi

# Create a new zsh configuration from the provided template
cp ~vagrant/.oh-my-zsh/templates/zshrc.zsh-template ~vagrant/.zshrc

# Change ownership of .zshrc
chown vagrant: ~vagrant/.zshrc

# Customize theme
sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="philips"/' ~vagrant/.zshrc

# Set zsh as default shell
chsh -s /bin/zsh vagrant
printf "\n========== Done installing zsh ==============="

# printf "\n****Installing Docker"
# wget -qO- https://get.docker.com/ | sh

printf "\n****Adding user vagrant to group docker"
sudo usermod -a -G docker vagrant

# printf "\n****Installing Compose"
# curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

printf "=== Test Installation of Docker and Compose"
docker --version
docker-compose --version
printf "\n**** Done *****"

printf "===== Install Heroku Toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

printf "====== Initial Setup is done! ======"

# printf "\n****Cleanup"
# apt-get clean && apt-get autoremove -yq && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# printf "\n========= Cleanup Complete ==============="
