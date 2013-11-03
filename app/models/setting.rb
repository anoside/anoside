class Setting < ActiveRecord::Base
  has_many :languages_settings
  has_many :languages, through: :languages_settings

  validates :email, uniqueness: true, email: true
end
