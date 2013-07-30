dep 'ruby.development' do
  requires 'chruby.managed',
	   'ruby-install.managed',
	   'memcached.managed',
	   'postgresql',
	   'qt.managed'
end

# Brew provided packages
dep 'ruby-install.managed'

# TODO - handle the steps that homebrew doesnt setup as a meta package. e.g launch daemons.
dep 'memcached.managed'

dep 'chruby.managed' do
  met? {
    "/usr/local/opt/chruby/share/chruby/chruby.sh".p.exists?
  }
end

# TODO - Ensure that homebrew is on path.

# TODO - make a postgres meta package that handles setting up a database.
dep 'postgresql' do
  requires 'benhoskings:postgres.managed', 'osx.SharedMemoryIncreased'
end

dep 'Postgres.app' do
  source 'http://postgresapp.com/download'
end

dep 'qt.managed' do
  provides 'qmake'
end

