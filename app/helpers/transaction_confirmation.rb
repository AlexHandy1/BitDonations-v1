require 'twilio-ruby'

helpers do
  def send_transaction_text
    @account_sid = ENV['TWILIO_SID']
    @auth_token = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    #add in database call for timestamp
    @client.account.messages.create(:body => "Thank you for your donation! Your donation was registered at #{(Time.now).asctime}", :to => current_donor.mobile, :from => "+441442796217")
  end
end