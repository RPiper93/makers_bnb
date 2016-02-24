class Request
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date
  has n, :users, through: Resource
  has n, :spaces, through: Resource
end
