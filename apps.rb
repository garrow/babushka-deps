SIMPLE_APPS = {
    'iTerm' => 'http://www.iterm2.com/downloads/stable/iTerm2_v1_0_0.zip',
    'Dropbox' => 'https://www.dropbox.com/download?plat=mac',
    'SizeUp' => 'http://www.irradiatedsoftware.com/download/SizeUp.zip',
    'Google Chrome' => 'https://dl-ssl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg',
    'Viscosity' => 'http://www.sparklabs.com/downloads/Viscosity.dmg',
    'Flux' => 'https://justgetflux.com/mac/Flux.zip',
    'RubyMine' => 'http://download.jetbrains.com/ruby/RubyMine-5.4.3.dmg',
    'KeePassX' => 'http://downloads.sourceforge.net/keepassx/KeePassX-0.4.3.dmg',
    'VLC' => 'http://get.videolan.org/vlc/2.0.7/macosx/vlc-2.0.7.dmg',
}

SIMPLE_APPS.each do |app_name, source_location|
  dep "#{app_name}.app", :template => 'app' do
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

