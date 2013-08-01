dep 'terminal' do
  requires 'dotfiles',
	   'managed_utilities'
end


dep 'bash.case_insensitive_completion' do
  met? {
    "/etc/inputrc".p.grep("set completion-ignore-case on")
  }
  meet {
    sudo 'echo "set completion-ignore-case on\n" >> /etc/inputrc'
  }
end


utilities = %w{ ack vim tree git-flow }
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
