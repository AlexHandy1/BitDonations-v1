post '/donate/:id' do
  p session['donor_id']
  if session['donor_id']
    @ent_id = params['ent_id']
    @resp = Blockchain::receive('12X6MREyoTDg6gGYf9BLZ26PaDCKA6xfmD', 'https://peaceful-sea-2336.herokuapp.com/')
    @input_address = @resp.input_address
    erb :'donate/id1'
  else
    flash[:notice] = "Please log-in to donate"
    redirect to('/')
  end
end