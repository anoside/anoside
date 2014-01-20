require 'spec_helper'

describe 'Posting', type: :feature, js: true do
  before do
    language = create(:language)
    user = create(:user, accept_language_id: language.id)

    login_as(user, scope: :user)
  end

  it 'User posts normally' do
    visit root_path

    find('article form textarea').click
    fill_in 'post[body]', with: 'hello'
    click_button '投稿する'

    expect(page).to have_content('hello')
  end
end
