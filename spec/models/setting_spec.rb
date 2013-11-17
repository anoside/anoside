require 'spec_helper'

describe Setting do
  # Setting is saved after User saved (See User's after_create).
  # This ugly code is written for saving Setting without User saving...
  Setting.instance_eval do
    before_create do
      self.user_id ||= 1
    end
  end

  describe 'Associations' do
    it { should have_many(:languages_settings) }
    it { should have_many(:languages) }
  end

  describe 'Validations' do
    it { should validate_uniqueness_of(:email) }
  end
end
