# -*- mode: ruby -*-
# vi: set ft=ruby :
disk = '../sata1.vdi'

Vagrant.configure("2") do |config|
  config.vm.define "Server-backup" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'Server-backup'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.56.9', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
      # Change memory size
      vb.memory = "1024"
      # Create & attach disk
      unless File.exist?(disk)
        vb.customize ['createhd', '--filename', disk, '--size', 2 * 1024]
      end
        vb.customize ['storagectl', :id, '--name', 'SATA', '--add', 'sata' ]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
      end
    end
  end

Vagrant.configure("2") do |config|
  config.vm.define "Client" do |cl|
    cl.vm.box = 'centos/stream8'
    cl.vm.host_name = 'Client'
    # Add networks
    cl.vm.network 'private_network', ip: '192.168.56.10', adapter: 8
    # Change VM
    cl.vm.provider :virtualbox do |vb|
      # Change memory size
      vb.memory = "1024"
    end
  end
end
