dep 'terminal' do
  requires 'bash',
    'bash.case_insensitive_completion',
    'dotfiles',
    'bcat',
    'ack',
    'vim',
    'tree',
    'wget'
end

dep 'bcat', template: 'gem'
dep 'ack',  template: 'bin'
dep 'vim',  template: 'bin'
dep 'tree', template: 'bin'
dep 'wget', template: 'bin'

