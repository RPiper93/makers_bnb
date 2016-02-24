require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'models/request'
require_relative 'models/space'

DataMapper.setup(:default, "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize
