require 'twilio-ruby'

helpers do
  def send_transaction_text
    @account_sid = 'ACea2ef6a5369b6c039579abf4a411ee36'
    @auth_token = 'c03c2130820bbed08e950482a336f9c8'
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    #add in database call for timestamp
    @client.account.messages.create(:body => "Thank you for your donation! Your donation was registered at #{(Time.now).asctime}", :to => current_donor.mobile, :from => "+441442796217")
  end
end