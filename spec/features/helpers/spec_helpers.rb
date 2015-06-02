module SessionHelper

  def sign_up(name="Alex", email='handy437@gmail.com', password='123', password_confirmation='123')
    within('#sign-up') do
      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
    end
  end

  def sign_in(email='handy437@gmail.com', password='123')
    within('#log-in') do
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Log in'
    end
  end
end