# https://github.com/bradfeehan/babushka-deps/raw/master/deps/homebrew_cask.rb
# Homebrew Cask provides a friendly homebrew-style CLI workflow for the
# administration of Mac applications distributed as binaries.
#
# https://github.com/phinze/homebrew-cask


# Installs Homebrew Cask
dep 'homebrew-cask', :for => :osx, :template => 'lib' do
  requires 'homebrew tap'.with('phinze/cask')
  installs 'brew-cask'
end
