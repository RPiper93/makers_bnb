require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/User'

DataMapper.setup(:default, "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize
DataMapper.auto_upgrade!
