require 'spec_helper'

describe User do
  describe 'Associations' do
    it { should have_many(:dislikes).dependent(:destroy) }
    it { should have_many(:follows).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:tags).through(:follows) }
    it { should have_one(:setting).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end
end
