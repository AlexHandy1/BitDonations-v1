require 'spec_helper'
require_relative 'helpers/spec_helpers'


include SessionHelper

feature 'Donor signs up' do
  xscenario 'through sign-up button and are added to the database' do
    visit('/')
    click_link('Sign Up')
    expect(Donor.count).to eq 0
    expect{ sign_up }.to change(Donor, :count).by(1)
    expect(Donor.first.name).to eq "Alex"
  end

  xscenario 'donor receives a confirmation email when added' do

  end
end