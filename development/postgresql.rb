# TODO - make a postgres meta package that handles setting up a database.
dep 'postgresql' do
  requires 'benhoskings:postgres.managed', 'osx.SharedMemoryIncreased'
end

dep 'Postgres.app' do
  source 'http://postgresapp.com/download'
end


