require 'spec_helper'

feature 'Sign up' do
  background do
    create(:language)
  end

  scenario 'User signs up normally' do
    visit new_user_registration_path

    within('#new_user') do
      fill_in 'user[username]', with: 'bojovs'
      fill_in 'user[password]', with: 'svojob'
    end

    expect { click_button '作成する' }.to change { User.count }.by 1
    expect(current_path).to eq '/'
  end
end
