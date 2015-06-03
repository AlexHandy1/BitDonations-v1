require 'spec_helper'
require_relative 'helpers/spec_helpers'


include SessionHelper

feature 'Donor signs out' do
  before(:each) do
    Donor.create(name: 'Alex',
                 email: 'handy437@gmail.com',
                 mobile: '+447913251479'
                 password: '123',
                 password_confirmation: '123')
  end

  xscenario 'and can no longer access the donate button' do

  end
end