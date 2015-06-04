get '/ent/new' do
  @entrepreneur = Entrepreneur.new
  erb :'ent/new'
end

post '/ent' do
  name, email, project, password, password_confirmation, wallet_password = params['name'], params['email'], params['project'], params['password'], params['password_confirmation'], params['wallet_password']

  @ent_wallet = Blockchain::create_wallet(wallet_password, 'a95e57e0-acb5-4dab-b009-32d76e12d145')
  p @ent_wallet
  @wallet_address = @ent_wallet.address

  @entrepreneur = Entrepreneur.create(name: name, email: email, project: project, password: password, password_confirmation: password_confirmation, wallet_address: @wallet_address)

  if @entrepreneur.save
    #could add in separate email confirmation method
    redirect to('/')
  else
    flash[:notice] = 'Your account was not saved, please enter the correct details'
    redirect to('/ent/new')
  end

end

post '/ent/:id' do
  @ent_id = params['ent_id']
  @ent = Entrepreneur.get(@ent_id)
  erb :'ent/id1'
end