class Booking 
  include DataMapper::Resource

  property :id, Serial
  property :date_from, Date 
  property :date_to, Date

  belongs_to :user
  belongs_to :space

end
