class User < ActiveRecord::Base
  attr_accessible :accept_language_id, :email, :guest, :password, :password_confirmation,
    :remember_me, :username
  attr_accessor :accept_language_id

  has_one :preference

  validates :password, presence: true
  validates :username, format: { with: /\A[A-Za-z0-9_]+\z/ }, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable, :rememberable, :trackable

  after_create do
    preference = Preference.create(user_id: self.id)
    LanguagesPreference.create(language_id: accept_language_id, preference_id: preference.id)
  end

  def self.new_guest
    username = "guest_#{SecureRandom.hex}"
    password = SecureRandom.hex

    User.new(username: username, password: password, guest: true)
  end
  
  def owns_post?(post)
    return false if post && post.user_id == 0

    self == post.user
  end
end
