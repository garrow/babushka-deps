dep 'fame' do
  requires 'redis', 'elasticsearch', 'imagemagick', 'postgresql', 'imagemagick'
end


dep 'redis' do
  requires 'redis.managed',
           'homebrew installed launchagent'.with('redis'),
           'launchctl has loaded'.with('redis')
end

dep 'redis.managed' do 
  provides 'redis-cli', 'redis-server'
end

dep 'elasticsearch' do
  requires 'elasticsearch.managed',
           'homebrew installed launchagent'.with('elasticsearch'),
           'launchctl has loaded'.with('elasticsearch')
end

dep 'elasticsearch.managed' do 
  requires 'java'
end

dep 'java', template: 'cask'

dep 'imagemagick', template: 'lib'
