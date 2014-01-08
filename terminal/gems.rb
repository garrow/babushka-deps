system_level_gems = %w{bcat}.collect {|g| "#{g}.gem" }

system_level_gems.each do |g|
  dep g
end
dep 'system level gems' do
  requires system_level_gems
end
