require 'spec_helper'
require_relative 'helpers/spec_helpers'


include SessionHelper

feature 'Donor signs out' do
  before(:each) do
    Donor.create(name: 'Alex',
                 email: 'handy437@gmail.com',
                 mobile: '+447913251479',
                 password: '123',
                 password_confirmation: '123')
    Entrepreneur.create(name: "Alex", email: '123@gmail.com',project: 'Microinsurance for farmers', password: '123', password_confirmation: '123', wallet_address: '12345678910')
  end

  scenario 'and can no longer access the donate button' do
    visit('/')
    click_link('Log In')
    sign_in
    within('.sign-out') do
      click_button('Sign out')
    end
    within('.donatebutton') do
      click_button('Donate')
    end
    expect(page).to have_content("Please log-in to donate")
  end
end