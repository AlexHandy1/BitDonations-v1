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

  #ACCESS PREVIOUSLY GENERATED ENTREPRENEUR BLOCKCHAIN WALLET FROM DATABASE
  @entrepreneur = Entrepreneur.get(@ent_id)

  #ACCESS DONOR WALLET FROM API AND SEND STATED BITCOIN TO ENTREPRENEUR
  @donor_wallet = Blockchain::Wallet.new(@donor_wallet_id, @donor_wallet_password)
  @payment = @donor_wallet.send(@entrepreneur.wallet_address, @satoshis, from_address: @donor_address)

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







