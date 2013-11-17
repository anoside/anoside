require 'spec_helper'

feature 'Sign in' do
  background do
    create(:language)
    create(:user)
  end

  scenario 'User signs in normally' do
    visit new_user_session_path

    within('#new_user') do
      fill_in 'user[username]', with: 'bojovs'
      fill_in 'user[password]', with: 'svojob'
    end

    click_button 'Sign in'

    expect(current_path).to eq '/'
  end
end
