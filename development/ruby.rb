dep 'ruby.development' do
  requires 'chruby.managed',
           'ruby-2.1.1'
	   #'memcached.managed',
           'postgresql',
	   #'qt.managed',
	   #'phantomjs.managed'
end

dep 'ruby-2.1.1' do
  requires 'ruby installed'.with('ruby', '2.1.1')
end

dep 'ruby installed', :runtime, :version do
  runtime.default('ruby')
  version.default('2.1.1')

  requires 'chruby.managed',
           'ruby-install.managed'

  def ruby_slug
    "#{runtime}-#{version}"
  end

  met? { "~/.rubies/#{ruby_slug}".p.exist? }
  meet {
    log "Installing Ruby #{runtime} #{version}"
    shell "ruby-install #{runtime} #{version}", :log => true
  }
end

# Brew provided packages
dep 'ruby-install.managed'
dep 'phantomjs.managed'


dep 'chruby.managed' do
  met? {
    "/usr/local/opt/chruby/share/chruby/chruby.sh".p.exists?
  }
end

# TODO - handle the steps that homebrew doesnt setup as a meta package. e.g launch daemons.
dep 'memcached.managed'

# TODO - Ensure that homebrew is on path.

dep 'qt.managed' do
  provides 'qmake'
end
