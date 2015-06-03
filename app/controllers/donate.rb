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

#Step 1 - get a manual, hardcoded 'send' request linked to my addresses working (hardcode amount etc) that is invoked when click Donate button
  #donor clicks on Donate button taken to Make a Donation page
    # >> simplest version would be to manually load my donor wallet address 1 as recipient(eventually call receive API on loaded wallet to get a randomely generated address) and then put in an address wallet address 2 that I create for sender
    # payment = wallet.send([recipient - entrepreneur]'1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob', [amount]1000000, [from_address - donor]: '1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq')
      # >> could send this with a hidden form underneath button which posts to donation/new and runs the send method whilst also showing a thank you for donation, click to go back to home-page
#Step 2 - donor completes form where they dynamically put in amount and their blockchain wallet address which they want to send from
#Step 3 - dynamically create blockchain wallets (with API) when donors and entrepreneurs sign-up and use convenience methods e.g. new_address, get_address to populate required fields
#Step 4 - add a confirmation step which checks transaction status and calls a Twilio text method (consider moving this up) to send a text
#Step 5 - add in a whole set-up and storage process to create wallet for either party so not brand new with every single transaction, actually want to invite users to set-up and then store?







