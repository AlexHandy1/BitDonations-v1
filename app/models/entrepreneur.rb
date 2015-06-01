require 'data_mapper'

class Entrepreneur
  include DataMapper::Resource

  has n, :donors, through: Resource
  has n, :transactions

  property :id, Serial
  property :project, Text
end