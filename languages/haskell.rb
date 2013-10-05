dep 'haskell' do
  requires 'haskell-platform.managed', 'ghc.managed'
end

dep 'haskell-platform.managed' do
  provides 'cabal', 'happy', 'alex'
end

dep 'ghc.managed'
