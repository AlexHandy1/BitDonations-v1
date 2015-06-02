post '/donate/:id' do
  @ent_id = params['ent_id']
  @resp = Blockchain::receive('12X6MREyoTDg6gGYf9BLZ26PaDCKA6xfmD', 'https://peaceful-sea-2336.herokuapp.com/')
  @input_address = @resp.input_address
  erb :'donate/id1'
end