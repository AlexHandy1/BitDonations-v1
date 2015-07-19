require 'spec_helper'
require 'rest-client'
require_relative 'helpers/spec_helpers'


include SessionHelper

feature 'Donor signs up' do
  scenario 'through sign-up button and is added to the database' do
    visit('/')
    click_link('Sign Up')
    click_button('Donor')
    expect(Donor.count).to eq 0
    expect{ sign_up }.to change(Donor, :count).by(1)
    expect(Donor.first.name).to eq "Alex"
  end

  scenario 'donor receives a confirmation email when added and is returned to the homepage' do
    RestClient::Request.stub(:execute).and_return('{
  "id": "<20150719140503.130429.20965@sandbox29795a797e5b4c75a3a5375cb657ff3a.mailgun.org>",
  "message": "Queued. Thank you."
}')
    visit('/')
    click_link('Sign Up')
    click_button('Donor')
    sign_up
    expect(current_path).to eq ('/')
  end
end