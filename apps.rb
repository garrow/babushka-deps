dep 'Applications' do
  requires 'desktop_help_utilities',
	   'Google Chrome.app',
	   'Viscosity.app',
           'RubyMine.app',
           'Dropbox.app',
	   'iTerm.app'
end

dep 'iTerm.app' do
  source 'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip'
end


dep 'desktop_help_utilities' do
  requires 'Flux.app',
           'SizeUp.app'
#	   'KeyRemap4MacBook.app'
end


dep 'Dropbox.app' do
  source 'https://www.dropbox.com/download?plat=mac'
end


dep 'SizeUp.app' do
  source 'http://www.irradiatedsoftware.com/download/SizeUp.zip'
end

dep 'KeyRemap4MacBook.app' do
#  requires 'osx.GateKeeperDisabled'
  source 'https://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-8.3.0.dmg'
end


dep 'Google Chrome.app' do
  source 'https://dl-ssl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
end
dep 'Viscosity.app' do
  source 'http://www.sparklabs.com/downloads/Viscosity.dmg'
end
dep 'Flux.app' do
  source 'https://justgetflux.com/mac/Flux.zip'
end
dep 'RubyMine.app' do
  source 'http://download.jetbrains.com/ruby/RubyMine-5.4.3.dmg'
end

dep 'Steam.app' do
  requires {
    on :osx, 'osx.AccesibilityAPIEnabled'
  }
  source 'http://media.steampowered.com/client/installer/steam.dmg'
end

