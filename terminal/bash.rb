dep 'bash' do
#  requires 'bash.bin',
#           'bash.enabled'
end

dep 'bash.bin'

dep 'bash.enabled' do
  requires 'bash.bin', 'bash.allowed shells'

  def homebrew_bash
    '/usr/local/bin/bash/'
  end

  met? {
    shell('finger `whoami` |grep bash').include? homebrew_bash
  }
  meet {
    sudo "chsh #{homebrew_bash} `whoami`", log: true
  }
end


dep 'bash.allowed shells' do
  met? {
    "/etc/shells".p.grep("/usr/local/bin/bash")
  }
  meet {
    sudo 'echo "/usr/local/bin/bash\n" >> /etc/shells'
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

