require 'spec_helper'

describe 'posts' do
  before do
    FactoryGirl.create(:language)
    FactoryGirl.create(:user, username: 'bojovs', password: 'svojob')
  end

  describe '#index', js: true do
    before do
      FactoryGirl.create_list(:post, 3)

      visit '/'
    end

    it 'shows posts' do
      expect(posts_list).to have_content('body-1')
    end
  end

  describe '#create', js: true do
    before do
      login

      fill_in 'post_body', with: 'hello world'
      click_button 'submit'
    end

    it 'creates a post' do
      expect(posts_list).to have_content('hello world')
    end
  end

  describe '#update', js: true do
    before do
      @post = FactoryGirl.create(:post)

      login
    end

    context 'update tags' do
      before do
        find('.tag-addition-button').click
        fill_in 'post_tag_list', with: 'tag1, tag2'
        click_button 'Save'
      end

      it 'saves 2 tags' do
        expect { @post.tags.count == 2 }.to become_true
      end
    end
  end
end
