require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/User'

require_relative './models/space.rb'

DataMapper.setup(:default, "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize
