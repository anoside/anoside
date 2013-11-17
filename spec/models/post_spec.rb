require 'spec_helper'

describe Post do
  describe 'Associations' do
    it { should belong_to(:language) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:dislikes) }
    it { should have_one(:viewpoint) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:body) }
    it { should ensure_length_of(:body).is_at_most(300) }
  end
end
