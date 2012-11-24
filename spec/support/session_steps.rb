module SessionSteps
  def login
    ensure_on '/users/signin'

    fill_in 'user_username', with: 'bojovs'
    fill_in 'user_password', with: 'svojob'

    click_button 'Sign In'
  end
end