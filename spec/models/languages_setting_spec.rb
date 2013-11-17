require 'spec_helper'

describe LanguagesSetting do
  # LanguagesSetting is saved after User saved (See User's after_create).
  # This ugly code is written for saving LanguagesSetting without User saving...
  LanguagesSetting.instance_eval do
    before_create do
      self.language_id ||= 1
    end
  end

  describe 'Associations' do
    it { should belong_to(:language) }
    it { should belong_to(:setting) }
  end
end
