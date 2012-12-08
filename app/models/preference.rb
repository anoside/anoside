class Preference < ActiveRecord::Base
  attr_accessible :email_when_commented, :language_ids, :user_id

  has_many :languages_preferences
  has_many :languages, through: :languages_preferences
end
