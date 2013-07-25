dep 'Google Chrome.app' do
  source 'https://dl-ssl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
end
dep 'Viscosity.app' do
  source 'http://www.sparklabs.com/downloads/Viscosity.dmg'
end
dep 'Flux.app' do
  source 'https://justgetflux.com/mac/Flux.zip'
end
dep 'Steam.app' do
  requires {
    on :osx, 'osx.AccesibilityAPIEnabled'
  }
  source 'http://media.steampowered.com/client/installer/steam.dmg'
end

dep 'osx.AccesibilityAPIEnabled' do
  met? {
   "/private/var/db/.AccessibilityAPIEnabled".p.exists?
  }
  meet {
    shell %q{osascript -e 'tell application "System Events" to set UI elements enabled to true'}
  }
end
