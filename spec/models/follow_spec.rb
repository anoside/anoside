require 'spec_helper'

describe Follow do
  describe 'Associations' do
    it { should belong_to(:tag) }
    it { should belong_to(:user) }
  end
end
