require 'spec_helper'

describe Comment do
  describe 'Associations' do
    it { should belong_to(:post) }
    it { should belong_to(:viewpoint) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:body) }
    it { should ensure_length_of(:body).is_at_most(300) }
  end
end
