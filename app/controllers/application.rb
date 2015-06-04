get '/' do
  @entrepreneurs = Entrepreneur.all
  erb :index
end

get '/signup/new' do
  erb :'signup/new'
end