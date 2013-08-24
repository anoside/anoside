class User < ActiveRecord::Base
  attr_accessor :accept_language_id
  
  has_one :preference

  validates :password, presence: true
  validates :username, format: { with: /\A[A-Za-z0-9_]+\z/ }, presence: true, uniqueness: true
  
  # :confirmable, :lockable, :timeoutable and :omniauthable, :token_authenticatable
  # :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  after_create do
    preference = Preference.create(user_id: self.id)
    LanguagesPreference.create(language_id: accept_language_id, preference_id: preference.id)
  end
end
