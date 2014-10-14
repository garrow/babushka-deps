dep 'homebrew cask' do
  requires 'homebrew formulae tapped'.with("caskroom/cask")
end



meta :cask do
  template do
    requires 'homebrew cask'

    def install(cask_to_install)
      shell! 'brew', 'cask', 'install', cask_to_install
    end

    def cask_name
      name.gsub(/\.cask\z/, '')
    end

    met? {
      x = shell("brew cask list").include? cask_name
    }
    meet {
      log "Installing Cask #{cask_name}"
      install cask_name
    }
  end
end
