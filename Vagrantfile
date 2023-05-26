# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "inetRouter" do |ir|
    ir.vm.box = 'centos/stream8'
    ir.vm.host_name = 'inetRouter'
    # Add networks
    ir.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: 'router-net'
    ir.vm.network :private_network, adapter: 3, auto_config: false, virtualbox__intnet: 'router-net'
    ir.vm.network :private_network, ip: '192.168.56.10', adapter: 8
    # Change memory size
    ir.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "centralRouter" do |cr|
    cr.vm.box = 'centos/stream8'
    cr.vm.host_name = 'centralRouter'
   # Add network
    cr.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: 'router-net'
    cr.vm.network :private_network, adapter: 3, auto_config: false, virtualbox__intnet: 'router-net'
    cr.vm.network :private_network, ip: '192.168.255.9', adapter: 6, netmask: '255.255.255.252', virtualbox__intnet: 'office1-central'
    cr.vm.network :private_network, ip: '192.168.56.11', adapter: 8
    # Change memory size
    cr.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "office1Router" do |o1r|
    o1r.vm.box = 'centos/stream8'
    o1r.vm.host_name = 'office1Router'
    # Add network
    o1r.vm.network :private_network, ip: '192.168.255.10', adapter: 2, netmask: '255.255.255.252', virtualbox__intnet: 'office1-central'
    o1r.vm.network :private_network, adapter: 3, auto_config: false, virtualbox__intnet: 'vlan1'
    o1r.vm.network :private_network, adapter: 4, auto_config: false, virtualbox__intnet: 'vlan1'
    o1r.vm.network :private_network, adapter: 5, auto_config: false, virtualbox__intnet: 'vlan2'
    o1r.vm.network :private_network, adapter: 6, auto_config: false, virtualbox__intnet: 'vlan2'
    o1r.vm.network :private_network, ip: '192.168.56.20', adapter: 8
    # Change memory size
    o1r.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "testClient1" do |tc1|
    tc1.vm.box = 'centos/stream8'
    tc1.vm.host_name = 'testClient1'
    # Add network
    tc1.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: 'testLAN'
    tc1.vm.network :private_network, ip: '192.168.56.21', adapter: 8
    # Change memory size
    tc1.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "testServer1" do |ts1|
    ts1.vm.box = 'centos/stream8'
    ts1.vm.host_name = 'testServer1'
    # Add network
    ts1.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: 'testLAN'
    ts1.vm.network :private_network, ip: '192.168.56.22', adapter: 8
    # Change memory size
    ts1.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "testClient2" do |tc2|
    tc2.vm.box = 'centos/stream8'
    tc2.vm.host_name = 'testClient2'
    # Add network
    tc2.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: "testLAN"
    tc2.vm.network :private_network, ip: '192.168.56.31', adapter: 8
    # Change memory size
    tc2.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "testServer2" do |ts2|
    ts2.vm.box = 'centos/stream8'
    ts2.vm.host_name = 'testServer2'
    # Add network
    ts2.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: "testLAN"
    ts2.vm.network :private_network, ip: '192.168.56.32', adapter: 8
    # Change memory size
    ts2.vm.provider :virtualbox do |vb|
      vb.memory = "512"
    end
  end
end
