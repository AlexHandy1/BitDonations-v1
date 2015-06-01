get '/' do
  @entrepreneurs = Entrepreneur.all
  erb :index
end