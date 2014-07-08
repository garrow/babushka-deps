dep 'rust.development' do
  requires 'rust.managed'
end

dep 'rust.managed' do
  provides 'rustc'
end
