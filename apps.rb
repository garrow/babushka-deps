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
    'Shiori' => 'http://aki-null.net/shiori/release/Shiori_1.0.1.zip',
    'Kindle' => 'http://kindleformac.amazon.com/40499/KindleForMac.dmg',
    'Firefox' => 'http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/23.0.1/mac/en-US/Firefox%2023.0.1.dmg',

}

dep "dotapps" do
  requires SIMPLE_APPS.keys.collect {|a| "#{a}.app" }
end

SIMPLE_APPS.each do |app_name, source_location|
  dep "#{app_name}.app", :template => 'app' do
    source source_location
  end
end

dep 'TotalSpaces.installer' do
  source 'http://downloads-1.binaryage.com/TotalSpaces-1.2.9.zip'
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
dep "Parallels Desktop.installer" do
    source  'http://dl.cleverbridge.com/329/mshi5o-15530-1F58E6B1-47875247/ParallelsDesktop-8.0.18608.898384.dmg'
end
