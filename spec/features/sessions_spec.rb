require 'spec_helper'

feature 'Sign in' do
  background do
    language = create(:language)
    create(:user, accept_language_id: language.id)
  end

  scenario 'User signs in normally' do
    visit new_user_session_path

    within('#new_user') do
      fill_in 'user[username]', with: 'bojovs'
      fill_in 'user[password]', with: 'svojob'
    end

    click_button 'ログイン'

    expect(current_path).to eq '/'
  end
end
