require 'spec_helper'

describe 'posts' do
  before do
    FactoryGirl.create(:user, username: 'bojovs', password: 'svojob')
  end

  describe '#index' do
    before do
      FactoryGirl.create_list(:post, 3)

      visit '/'
    end

    it 'shows posts' do
      posts_list.should have_content('body-1')
    end
  end

  describe '#create' do
    before do
      login

      fill_in 'post_body', with: 'hello world'
      click_button 'Create Post'
    end

    it 'creates a post' do
      posts_list.should have_content('hello world')
    end
  end

  describe '#update' do
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
        @post.tags.count.should == 2
      end
    end
  end
end