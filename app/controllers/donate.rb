post '/donate/:id' do
  @ent_id = params['ent_id']
  erb :'donate/id1'
end