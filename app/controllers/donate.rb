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

#Step 1 - get a manual, hardcoded 'send' request linked to my addresses working (hardcode amount etc) that is invoked when click Donate button
  #donor clicks on Donate button taken to Make a Donation page
    # >> simplest version would be to manually load my donor wallet address 1 as recipient(eventually call receive API on loaded wallet to get a randomely generated address) and then put in an address wallet address 2 that I create for sender
    # payment = wallet.send([recipient - entrepreneur]'1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob', [amount]1000000, [from_address - donor]: '1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq')
      # >> could send this with a hidden form underneath button which posts to donation/new and runs the send method whilst also showing a thank you for donation, click to go back to home-page
#Step 2 - donor completes form where they dynamically put in amount and their blockchain wallet address which they want to send from
#Step 3 - dynamically create blockchain wallets (with API) when donors and entrepreneurs sign-up and use convenience methods e.g. new_address, get_address to populate required fields
#Step 4 - add a confirmation step which checks transaction status and calls a Twilio text method (consider moving this up) to send a text