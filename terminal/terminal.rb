dep 'terminal' do
  requires 'bash',
   'dotfiles',
   'managed_utilities',
   'system level gems'
end


dep 'bash' do
  requires 'bash.enabled'
end

dep 'bash.allowed shells' do
  met? {
    "/etc/shells".p.grep("/usr/local/bin/bash")
  }
  meet {
    sudo 'echo "/usr/local/bin/bash\n" >> /etc/shells'
  }
end

dep 'bash.enabled' do
  requires 'bash.managed', 'bash.allowed shells'

  meet {
    sudo 'chsh /usr/local/bin/bash/ `whoami`'
  }
end

dep 'bash.case_insensitive_completion' do
  met? {
    "/etc/inputrc".p.grep("set completion-ignore-case on")
  }
  meet {
    sudo 'echo "set completion-ignore-case on\n" >> /etc/inputrc'
  }
end


utilities = %w{ bash ack vim tree git-flow wget }
managed_utilities = utilities.collect {|u| "#{u}.managed" }
managed_utilities.each { |u| dep u }
dep 'managed_utilities' do
  requires managed_utilities
end

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
