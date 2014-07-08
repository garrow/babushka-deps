dep 'terminal' do
  requires 'bash',
   'dotfiles',
   'managed_utilities',
   'bcat.gem'
end

dep 'bcat.gem'

utilities = %w{ bash ack vim tree wget }
managed_utilities = utilities.collect {|u| "#{u}.managed" }
managed_utilities.each { |u| dep u }
dep 'managed_utilities' do
  requires managed_utilities
end

