require 'spec_helper'
require_relative 'helpers/spec_helpers'

include SessionHelper

feature 'Donor signs in' do
  before(:each) do
    Donor.create(name: 'Alex',
                 email: 'handy437@gmail.com',
                 mobile: '+447913251479',
                 password: '123',
                 password_confirmation: '123')
    Entrepreneur.create(name: "Alex", email: '123@gmail.com',project: 'Microinsurance for farmers', password: '123', password_confirmation: '123', wallet_address: '12345678910')
    end

  scenario 'as an existing user I can log-in and receive Welcome back message' do
    visit('/')
    expect(page).not_to have_content("Welcome back, Alex")
    click_link('Log In')
    sign_in
    expect(page).to have_content("Welcome back, Alex")
  end

  scenario 'as an existing, logged in user I can go to the donate page' do
    visit('/')
    expect(page).not_to have_content("Welcome back, Alex")
    click_link('Log In')
    sign_in
    within('.donatebutton') do
      click_button('Donate')
    end
    expect(page).to have_content("Make a donation!")
  end

  scenario 'without credentials I cannot go to the donate page' do
    visit('/')
    within('.donatebutton') do
      click_button('Donate')
    end
    expect(page).to have_content("Please log-in to donate")
  end

  scenario 'without correct credentials I cannot log-in' do
    visit('/')
    expect(page).not_to have_content("Welcome back, Alex")
    click_link('Log In')
    sign_in('handy437@gmail.com', 'wrong')
    expect(page).not_to have_content("Welcome back, Alex")
  end
end

