require 'spec_helper'

feature 'Show entrepreneurs' do
  before(:each) do
    Entrepreneur.create(project: 'Microinsurance for farmers')
    #may need to add other fields, donors and transactions
    Entrepreneur.create(project: 'Teaching app for students')
  end

  scenario 'in a grid on the homepage' do
    visit('/')
    expect(page).to have_selector('div#project1', text: 'Microinsurance for farmers')
    expect(page).to have_selector('div#project2', text: 'Teaching app for students')
  end
end