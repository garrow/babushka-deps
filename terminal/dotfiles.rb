dep 'dotfiles' do
  def dotfiles_location
    File.join(ENV["HOME"], '.dotfiles')
  end

  def dotfiles_repo
    "git@github.com:garrow/dotfiles.git"
  end

  met? {
    File.exists?(dotfiles_location)
  }

  meet {
    log "cloning #{dotfiles_repo} into #{dotfiles_location}"
    shell "git clone #{dotfiles_repo} #{dotfiles_location}", :spinner => true
    shell "cd #{dotfiles_location} && make install", :spinner => true
  }
end

dep 'Inconsolata-G' do
  requires_when_unmet 'dotfiles'

  def installed_font_file
    '/Library/Fonts/Inconsolata-g.ttf'
  end

  def source_font_file
    '~/.dotfiles/resources/Inconsolata-g.ttf'
  end

  met? { installed_font_file.p.exist? }
  meet {
    log "Installing Inconsolata-G Font"
    shell "cp #{source_font_file} #{installed_font_file}", :spinner => true
  }
end
