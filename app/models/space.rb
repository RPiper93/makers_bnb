class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Float, required: true
  property :date_from, Date, required: true
  property :date_to, Date, required: true

  def format_date(date)
    date.strftime("%d/%m/%y")
  end
end
