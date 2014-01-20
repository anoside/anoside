require 'spec_helper'

describe 'Tagging', type: :feature, js: true do
  before do
    language = create(:language)
    user = create(:user, accept_language_id: language.id)
    post = create(:post, language: language)
    user.make_viewpoint(post, original: true)

    login_as(user, scope: :user)
  end

  it 'User can add tags to posts' do
    visit root_path

    find('i.fa-tag').click
    fill_in 'post[tag_list]', with: 'tag1, tag2'
    click_button '保存する'

    expect(page).to have_link('tag1', href: '/tags/tag1')
    expect(page).to have_link('tag2', href: '/tags/tag2')
  end
end
