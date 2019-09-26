#!/usr/bin/env bash
printf "=== Install NodeJS ==="
apt-get install -y g++
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
printf "=== Test Installation of NodeJS ==="
node -v
printf "\n===== Node Setup is Done ====="
printf "\n===== Install Yarn ====="
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
printf "=== Test Installation of Yarn ==="
yarn -v
printf "\n===== Yarn Setup is Done ====="