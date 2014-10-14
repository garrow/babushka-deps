dep 'postgresql' do
  requires 'postgresql superuser exists'.with('postgres'),
           'postgresql is running',
           'postgresql is daemonised'
end

dep 'postgresql superuser exists', :role_name do
  role_name.default('postgres')

  requires 'postgresql is running'

  def role_exists?(role_name)
    roles = shell %Q[psql postgres -c "select rolname from pg_roles WHERE rolname='#{role_name}'"]
    roles.include? role_name   
  end

  met? {
    role_exists? role_name
  }
  meet {
    log "Adding #{role_name} user"
    shell? "createuser --superuser #{role_name}", log: true
  }
end

dep 'postgresql is running' do
  requires 'postgresql is daemonised'

  def data_dir
    "/usr/local/var/postgres"
  end

  met? { shell? "pg_ctl", "status", "-D", data_dir }
end


dep 'postgresql is daemonised' do
  requires 'postgresql.managed',
           'homebrew installed launchagent'.with("postgresql"), 
           'launchctl has loaded'.with('postgresql')
end

dep 'postgresql.managed' do
  provides 'psql'
end
