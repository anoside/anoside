require 'spec_helper'

describe Dislike do
  describe 'Associations' do
    it { should belong_to(:dislikable) }
    it { should belong_to(:user) }
  end
end
