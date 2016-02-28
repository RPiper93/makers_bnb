class Request
  include DataMapper::Resource

  property :id, Serial
  property :date_from, Date, required: true
  property :date_to, Date, required: true
  property :status, String

  belongs_to :user
  belongs_to :space
end
