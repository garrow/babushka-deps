dep 'garrow' do
  requires 'terminal', 'Applications'
end

dep 'Applications' do
  requires 'desktop_help_utilities',
	   'Google Chrome.app',
	   'Viscosity.app',
           'RubyMine.app',
           'Dropbox.app',
           'iTerm.app',
           'KeePassX.app'
end

dep 'desktop_help_utilities' do
  requires 'Flux.app',
           'SizeUp.app'
#	   'KeyRemap4MacBook.app'
end
