require 'spec_helper'

describe Viewpoint do
  describe 'Associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end
end
