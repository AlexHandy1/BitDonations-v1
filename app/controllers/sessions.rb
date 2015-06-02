get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  email, password = params['email'], params['password']

  @donor = Donor.authenticate(email, password)

    if @donor
      session['donor_id'] = @donor.id
      flash[:notice] = "Welcome back, #{@donor.name}"
      flash[:errors] = nil
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
end

delete '/sessions' do
  session['donor_id'] = nil
  redirect to('/')
end