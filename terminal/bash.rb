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

