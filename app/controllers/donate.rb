post '/donate/:id' do
  p session['donor_id']
  if session['donor_id']
    @ent_id = params['ent_id']
    session['ent_id'] = @ent_id
    erb :'donate/id1'
  else
    flash[:notice] = "Please log-in to donate"
    redirect to('/')
  end
end

post '/donate/:id/new' do
  @ent_id = session['ent_id']
  #GET DONOR BITCOIN PAYMENT INPUT
  @satoshis, @donor_wallet_id, @donor_wallet_password, @donor_address = params['satoshis'], params['wallet-id'], params['wallet-password'], params['wallet-address']
  @satoshis = @satoshis.to_i

  #CREATE NEW ENTREPRENEUR WALLET THROUGH API
  @ent_wallet = Blockchain::create_wallet('12345678910', 'a95e57e0-acb5-4dab-b009-32d76e12d145') #inputs are a password and the API key
  p @ent_wallet
  @ent_address = @ent_wallet.address

  #ACCESS DONOR WALLET FROM API AND SEND STATED BITCOIN TO ENTREPRENEUR
  @donor_wallet = Blockchain::Wallet.new(@donor_wallet_id, @donor_wallet_password)
  @payment = @donor_wallet.send(@ent_address, @satoshis, from_address: @donor_address)

  #STORE TRANSACTION IN DATABASE
  @transaction = Transaction.create(amount: @satoshis, entrepreneur_id: @ent_id, donor_id: current_donor.id)

  #VERIFY TRANSACTION OCCURRED
  if @payment.tx_hash
    send_transaction_text
    erb :'donate/complete'
  else
    flash[:notice] = 'Transaction failed, please try again'
    redirect to('/')
  end
end







