dep 'ruby.development' do
  requires 'chruby.managed',
	   'ruby-install.managed',
	   'memcached.managed',
	   'postgresql',
	   'qt.managed',
	   'phantomjs.managed'
end

# Brew provided packages
dep 'ruby-install.managed'
dep 'phantomjs.managed'

# TODO - handle the steps that homebrew doesnt setup as a meta package. e.g launch daemons.
dep 'memcached.managed'

dep 'chruby.managed' do
  met? {
    "/usr/local/opt/chruby/share/chruby/chruby.sh".p.exists?
  }
end

# TODO - Ensure that homebrew is on path.

# TODO - make a postgres meta package that handles setting up a database.
dep 'postgresql' do
  requires 'benhoskings:postgres.managed', 'osx.SharedMemoryIncreased'
end

dep 'Postgres.app' do
  source 'http://postgresapp.com/download'
end

dep 'qt.managed' do
  provides 'qmake'
end


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

