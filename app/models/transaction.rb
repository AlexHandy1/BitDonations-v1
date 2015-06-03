require 'data_mapper'

class Transaction
  include DataMapper::Resource

  belongs_to :donor, :required => true
  belongs_to :entrepreneur, :required => true

  property :id, Serial
  property :created_at, DateTime
  property :amount, String

end