dep 'vagrant' do
  requires 'vagrant.installer', 'virtualbox'
end

dep 'vagrant.installer' do
  source 'http://files.vagrantup.com/packages/9a394588a6dcf97e8f916da9564088fcf242c4b3/Vagrant-1.3.2.dmg'
end

dep "virtualbox" do
  requires {
    on :osx, "VirtualBox.installer"
  }
end

dep "VirtualBox.installer" do
  source "http://download.virtualbox.org/virtualbox/4.2.18/VirtualBox-4.2.18-88780-OSX.dmg"
  provides "VirtualBox", "VBoxManage ~> 4.2.0  ", "VBoxHeadless"
end

