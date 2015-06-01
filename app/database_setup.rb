env = ENV['RACK_ENV'] ||'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bitdonations_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!