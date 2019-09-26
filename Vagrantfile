# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

BaseBox = "bento/ubuntu-16.04"

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: $script
  config.vm.box = BaseBox
  config.vm.hostname = 'rails-dev-box'
  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.network :forwarded_port, guest: 587, host: 587
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  # config.vm.network :forwarded_port, guest: 5432, host: 65432
  config.vm.network :private_network, ip: "192.168.10.101"
  config.vm.synced_folder ".", "/vagrant", type: 'nfs'
  config.vm.provision :shell, path: 'Provisions/zsh.sh'
  config.vm.provision :shell, path: 'Provisions/nodejs.sh'
  config.vm.provision :shell, path: 'Provisions/ruby-rails.sh'
  config.vm.provider 'virtualbox' do |v|
    v.memory = ENV.fetch('RAILS_DEV_BOX_RAM', 2048).to_i
    v.cpus   = ENV.fetch('RAILS_DEV_BOX_CPUS', 2).to_i
  end
  config.vm.provision :shell, inline: "echo colors desert >> ~/.vimrc"
end

Vagrant::Config.run do |config|
  config.vm.box = BaseBox
  # config.vm.host_name = "postgresql" 

  config.vm.share_folder "bootstrap", "/mnt/bootstrap", ".", :create => true
  config.vm.provision :shell, :path => "Provisions/bootstrap.sh"
  
  # PostgreSQL Server port forwarding
  config.vm.forward_port 5432, 15432
end