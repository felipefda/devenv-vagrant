Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "archdevfelipe"
  config.vm.provision :shell, :path => "sh_core.sh"
  config.vm.provision :shell, :path => "sh_user.sh",  :privileged => false
  config.vm.provision :shell, :path => "sh_java.sh",  :privileged => false
  config.vm.provision :shell, :path => "sh_java2.sh"
  config.vm.provision :shell, :path => "sh_node.sh",  :privileged => false
  config.vm.provision :shell, :path => "sh_oracle_ojdbc_wl.sh",  :privileged => false
  config.vm.provision :shell, :path => "sh_end.sh"
  config.vm.synced_folder "swap/", "/home/vagrant/swap"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "forwarded_port", guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "archdev"
    vb.memory = "8192"
    vb.cpus = "6" 
    # Customize the VM:
    # Enable sound support
    # (available options for audiocontroller: "hda" for Linux host, "sb16", "ac97" for Windows host)
    # (available options for audio: "alsa" or "pulse" for Linux host, "dsound" for Windows host, "coreaudio" for Mac OS)
    vb.customize ["modifyvm", :id, '--audio', 'dsound', '--audiocontroller', 'ac97']
    # Customize video memory
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end
end
