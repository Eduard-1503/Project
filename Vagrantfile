# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "inetRouter-1" do |ir1|
    ir1.vm.box = 'centos/stream8'
    ir1.vm.host_name = 'inetRouter-1'
    # Add networks
    ir1.vm.network 'forwarded_port', guest: 80, host: 8080, protocol: 'tcp'
    ir1.vm.network :private_network, ip: '192.168.255.1', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: 'inetrouter1-net'
    ir1.vm.network :private_network, ip: '192.168.56.9', adapter: 8
    # Change memory size
    ir1.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "inetRouter-2" do |ir2|
    ir2.vm.box = 'centos/stream8'
    ir2.vm.host_name = 'inetRouter-2'
    # Add networks
    # ir2.vm.network 'forwarded_port', guest: 8080, host: 8080, protocol: 'tcp'
    ir2.vm.network 'private_network', ip: '192.168.56.10', adapter: 8
    # Change memory size
    ir2.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "centralRouter" do |rt_c|
    rt_c.vm.box = 'centos/stream8'
    rt_c.vm.host_name = 'centralRouter'
   # Add network
    rt_c.vm.network :private_network, ip: '192.168.255.2', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: 'inetrouter1-net'
    rt_c.vm.network :private_network, ip: '192.168.0.1', adapter: 3, netmask: "255.255.255.240", virtualbox__intnet: 'dir-net'
    rt_c.vm.network :private_network, ip: '192.168.56.11', adapter: 8
    # Change memory size
    rt_c.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "centralServer" do |srv_c|
    srv_c.vm.box = 'centos/stream8'
    srv_c.vm.host_name = 'centralServer'
    # Add network
    # srv_c.vm.network 'forwarded_port', guest: 80, host: 8888, protocol: 'tcp'
    srv_c.vm.network :private_network, ip: '192.168.0.2', adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: 'dir-net'
    srv_c.vm.network :private_network, ip: '192.168.56.12', adapter: 8
    # Change memory size
    srv_c.vm.provider :virtualbox do |vb|
      vb.memory = "1024"
    end
  end
end
