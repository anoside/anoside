require 'spec_helper'

describe Like do
  describe 'Associations' do
    it { should belong_to(:likable) }
    it { should belong_to(:user) }
  end
end
