dep 'pebble.dev' do
  requires 'homebrew',
#           'pebble-sdk',
           'libmpc.lib',
           'freetype.lib'

end

dep 'pebble-sdk.src', :version do
  version.default!("5")
  source "https://account.getpebble.com/sdk_releases/#{version}/download"
  build { shell "echo 1" }
  install { shell "cd ~/pebble-dev/ ; tar -xzf ~/Downloads/PebbleSDK-1.12.tar.gz " }
end

dep 'libmpc.lib'
dep 'freetype.lib'

