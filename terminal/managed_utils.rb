utilities = %w{ bash ack vim tree git-flow wget }
managed_utilities = utilities.collect {|u| "#{u}.managed" }
managed_utilities.each { |u| dep u }
dep 'managed_utilities' do
  requires managed_utilities
end

