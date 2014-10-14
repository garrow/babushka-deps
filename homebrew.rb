dep 'homebrew formulae tapped', :formulae do
  requires 'homebrew'

  met? { shell("brew tap").include? formulae }
  meet { shell 'brew', 'tap', formulae  }
end

HomebrewManagedService = Struct.new :name do
  def agents
    "~/Library/LaunchAgents/"
  end

  def launch_agent_file
    "#{agents}/#{agent_file}"
  end

  def job_name
    "homebrew.mxcl.#{name}"
  end

  def agent_file
    "#{job_name}.plist"
  end

  def source_file
    "/usr/local/opt/#{name}/#{agent_file}"
  end
end

dep 'homebrew installed launchagent', :service_name do
  def service
    @service ||= HomebrewManagedService.new(service_name)
  end

  met? { service.launch_agent_file.p.exist? }
  meet { 
    log "Linking #{service.name} agent - #{service.source_file} to #{service.launch_agent_file}"
    shell "ln -fs #{service.source_file} #{service.launch_agent_file}", log: true 
    }
end

dep 'launchctl has loaded', :service_name do
  requires 'homebrew installed launchagent'.with(service_name), 

  def service
    @service ||= HomebrewManagedService.new(service_name)
  end

  met? { shell?("launchctl list | grep #{service.job_name}") }
  meet {
    log "Loading LaunchAgent for #{service.job_name}"
    shell "launchctl load -w #{service.launch_agent_file}", log: true
  }
end
