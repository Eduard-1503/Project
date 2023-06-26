# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "Server-WD" do |srv|
    srv.vm.box = 'centos/stream8'
    srv.vm.host_name = 'Server-WD'
    # Forwardinf ports
    srv.vm.network 'forwarded_port', guest: 8081, host: 8081, protocol: 'tcp'
    srv.vm.network 'forwarded_port', guest: 8082, host: 8082, protocol: 'tcp'
    srv.vm.network 'forwarded_port', guest: 8083, host: 8083, protocol: 'tcp'
    # Change VM
    srv.vm.provider :virtualbox do |vb|
      # Change memory size
      vb.memory = "2048"
      # Change amount cpus
      vb.cpus = "2"
      end
    end
#  end
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vv"
    ansible.playbook = "provisioning/playbook.yaml"
    ansible.become = "true"
  end
end
