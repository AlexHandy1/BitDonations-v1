get '/donor/new' do
  @donor = Donor.new
  erb :'donor/new'
end

post '/donor' do
  name, email, mobile, password, password_confirmation = params['name'], params['email'], params['mobile'],params['password'], params['password_confirmation']
  @donor = Donor.create(name: name, email: email, mobile: mobile, password: password, password_confirmation: password_confirmation)
  @new_donor = Donor.first(@donor.email)

  if @donor.save
    # send_confirmation_email
    redirect to('/')
  else
    flash[:notice] = 'Your account was not saved, please enter the correct details'
    redirect to('/donor/new')
  end
end