#!/usr/bin/env bash
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