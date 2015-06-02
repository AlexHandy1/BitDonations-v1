get '/donor/new' do
  @donor = Donor.new
  erb :'donor/new'
end

post '/donor' do
  name, email, password, password_confirmation = params['name'], params['email'], params['password'], params['password_confirmation']
  @donor = Donor.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
  #test - will implement in sessions
  @new_donor = Donor.first(@donor.name)

  if @donor.save
    send_confirmation_email
    redirect to('/')
  else
    redirect to('/donor/new')
  end
end