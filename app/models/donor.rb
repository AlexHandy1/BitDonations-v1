require 'data_mapper'
require 'bcrypt'

class Donor
  include DataMapper::Resource

  has n, :entrepreneurs, through: Resource
  has n, :transactions

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text


end