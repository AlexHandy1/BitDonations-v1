require 'rest-client'
require 'mailgun'

helpers do
  def send_confirmation_email
   response = RestClient::Request.execute(
      :url => "https://api:key-f2020f88c49bf88447183f58a61269a0"\
  "@api.mailgun.net/v3/sandbox29795a797e5b4c75a3a5375cb657ff3a.mailgun.org/messages",
      :method => :post,
      :payload => {
        :from => 'Mailgun Sandbox <postmaster@sandbox29795a797e5b4c75a3a5375cb657ff3a.mailgun.org>',
        :sender => 'Mailgun Sandbox <postmaster@sandbox29795a797e5b4c75a3a5375cb657ff3a.mailgun.org>',
        :to => @donor.email,
        :subject => "Congratulations on signing-up to BitDonations",
        :text => "Welcome " + @donor.name + " you can now donate to entrepreneurs directly using Bitcoin",
        :multipart => true
      },
      :headers => {
        :"h:X-My-Header" => "www/mailgun-email-send"
      },
      :verify_ssl => false
    )
   return response
  end
end