post '/ent/:id' do
  @ent_id = params['ent_id']
  erb :'ent/id1'
end