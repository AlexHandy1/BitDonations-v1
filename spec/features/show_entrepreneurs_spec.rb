require 'spec_helper'

feature 'Show entrepreneurs' do
  before(:each) do
    Entrepreneur.create(project: 'Microinsurance for farmers')
    #may need to add other fields, donors and transactions
  end

  scenario 'with their projects in a grid on the homepage' do
    visit('/')
    expect(page).to have_selector('div#project', text: 'Microinsurance for farmers')
  end

  scenario 'with links to their profile page' do
    visit('/')
    expect(page).to have_content('BitDonations')
    click_button "Find out more"
    expect(page).to have_content('Welcome to Project')
  end

  scenario 'with a button to make a Bitcoin donation' do
    visit('/')
    expect(page).to have_content('BitDonations')
    click_button "Donate"
    expect(page).to have_content('Make a donation')
  end
end