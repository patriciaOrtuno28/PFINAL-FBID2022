# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.provider :libvirt do |libvirt|
        libvirt.driver = "kvm"
    end

    config.vm.box = "bento/ubuntu-22.04"

    config.vm.define "fbid" do |ubuntu|
        ubuntu.vm.hostname = "fbid"
    end

    config.vm.provision:shell, path: "VM.sh"
end