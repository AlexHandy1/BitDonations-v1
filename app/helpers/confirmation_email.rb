require 'rest-client'

helpers do
  def send_confirmation_email
    RestClient.post 'https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0'\
        '@api.mailgun.net/v2/samples.mailgun.org/messages',
      from: "Mailgun Sandbox <postmaster@sandbox29795a797e5b4c75a3a5375cb657ff3a.mailgun.org>",
      to: "Alex Handy <handy437@gmail.com>",
      subject: 'Congratulations on signing-up to BitDonations',
      text:'Welcome #{@donor.name} you can now donate to entrepreneurs directly using Bitcoin'
  end
end