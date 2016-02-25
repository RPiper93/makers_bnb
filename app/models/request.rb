class Request
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date
  property :status, String

  belongs_to :user
  belongs_to :space
end
