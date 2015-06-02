require 'data_mapper'
require 'bcrypt'

class Donor
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :entrepreneurs, through: Resource
  has n, :transactions

  validates_confirmation_of :password
  validates_uniqueness_of :email

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end