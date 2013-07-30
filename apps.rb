SIMPLE_APPS = {
  'iTerm.app'  =>  'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip',
  'Dropbox.app'  =>  'https://www.dropbox.com/download?plat=mac',
  'SizeUp.app'  =>  'http://www.irradiatedsoftware.com/download/SizeUp.zip',
  'Google Chrome.app' =>'https://dl-ssl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg',
  'Viscosity.app' =>'http://www.sparklabs.com/downloads/Viscosity.dmg',
  'Flux.app' =>'https://justgetflux.com/mac/Flux.zip',
  'RubyMine.app' =>'http://download.jetbrains.com/ruby/RubyMine-5.4.3.dmg',
  'KeePassX.app' =>'http://downloads.sourceforge.net/keepassx/KeePassX-0.4.3.dmg',
  'VLC.app' =>'http://get.videolan.org/vlc/2.0.7/macosx/vlc-2.0.7.dmg',
}

SIMPLE_APPS.each do |app_name, source_location|
  dep app_name do
    source source_location
  end
end

dep 'KeyRemap4MacBook.app' do
#  requires 'osx.GateKeeperDisabled'
  source 'https://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-8.3.0.dmg'
end

dep 'Steam.app' do
  requires {
    on :osx, 'osx.AccesibilityAPIEnabled'
  }
  source 'http://media.steampowered.com/client/installer/steam.dmg'
end

