require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_hash, Text, required: true
  has n, :requests

  has n, :spaces
  has n, :bookings

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(email: email)
    if user 
      if BCrypt::Password.new(user.password_hash) == password
        user 
      else 
        :incorrect_password
      end
    else
      :nonexistent_user
    end   
  end
end
