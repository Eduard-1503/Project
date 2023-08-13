# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "IR" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'IR'
    # Add networks
    #srv.vm.network 'forwarded_port', guest: 80, host: 80, protocol: 'tcp'
    srv.vm.network 'forwarded_port', guest: 443, host: 4433, protocol: 'tcp'
    #srv.vm.network 'forwarded_port', guest: 8080, host: 8080, protocol: 'tcp'
    srv.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: 'ir-cr'
    srv.vm.network :private_network, adapter: 3, auto_config: false, virtualbox__intnet: 'ir-cr'
    srv.vm.network :private_network, ip: '192.168.0.1', adapter: 4, netmask: "255.255.255.252", virtualbox__intnet: 'web'
    srv.vm.network :private_network, ip: '192.168.0.9', adapter: 5, netmask: "255.255.255.252", virtualbox__intnet: 'backup'
    srv.vm.network :private_network, ip: '192.168.56.10', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '512'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "CR" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'CR'
    # Add networks
    srv.vm.network :private_network, adapter: 2, auto_config: false, virtualbox__intnet: 'ir-cr'
    srv.vm.network :private_network, adapter: 3, auto_config: false, virtualbox__intnet: 'ir-cr'
    srv.vm.network :private_network, ip: '192.168.1.1', adapter: 4, netmask: "255.255.255.248", virtualbox__intnet: 'hw-net'
    srv.vm.network :private_network, ip: '192.168.56.20', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '512'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "SrvWeb" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'SrvWeb'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.0.2', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: 'web'
    srv.vm.network :private_network, ip: '192.168.56.30', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '1024'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "SrvBackup" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'SrvBackup'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.0.10', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: 'backup'
    srv.vm.network :private_network, ip: '192.168.56.40', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '512'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "SrvDB" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'SrvDB'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.1.2', adapter: 2, netmask: "255.255.255.248", virtualbox__intnet: 'hw-net'
    srv.vm.network :private_network, ip: '192.168.56.50', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '1024'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "SrvRep" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'SrvRep'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.1.3', adapter: 2, netmask: "255.255.255.248", virtualbox__intnet: 'hw-net'
    srv.vm.network :private_network, ip: '192.168.56.60', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '1024'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "SrvLog" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'SrvLog'
    # Add networks
    srv.vm.network :private_network, ip: '192.168.1.4', adapter: 2, netmask: "255.255.255.248", virtualbox__intnet: 'hw-net'
    srv.vm.network :private_network, ip: '192.168.56.70', adapter: 8
    # Change VM
    srv.vm.provider :virtualbox do |vb|
    # Change memory size
      vb.memory = '512'
    # Change memory size      
    #  vb.cpus = '1'
    end
  end
end
