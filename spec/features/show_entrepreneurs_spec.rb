require 'spec_helper'

feature 'Show entrepreneurs' do
  before(:each) do
    Entrepreneur.create(name: "Alex", email: '123@gmail.com',project: 'Microinsurance for farmers', password: '123', password_confirmation: '123', wallet_address: '12345678910')
    Donor.create(name: 'Alex',
                 email: 'handy437@gmail.com',
                 mobile: '+447913251479',
                 password: '123',
                 password_confirmation: '123')
  end

  scenario 'with their projects in a grid on the homepage' do
    visit('/')
    expect(page).to have_selector('div.project', text: 'Microinsurance for farmers')
  end

  scenario 'with links to their profile page' do
    visit('/')
    expect(page).to have_content('BitDonations')
    click_button "Find out more"
    expect(page).to have_content('Microinsurance for farmers')
  end

  scenario 'with a button to make a Bitcoin donation' do
    visit('/')
    click_link('Log In')
    sign_in
    visit('/')
    expect(page).to have_content('BitDonations')
    click_button "Donate"
    expect(page).to have_content('Make a donation!')
  end
end