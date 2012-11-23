class User < ActiveRecord::Base
  attr_accessible :email, :guest, :password, :password_confirmation,
    :remember_me, :username

  has_one :preference

  validates :password, presence: true
  validates :username, format: { with: /\A[A-Za-z0-9_]+\z/ }, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable, :rememberable, :trackable

  after_create do
    Preference.create(user_id: self.id)
  end

  def self.create_guest
    username = "guest_#{SecureRandom.hex}"
    password = SecureRandom.hex

    User.create(username: username, password: password, guest: true)
  end
  
  def owns_post?(post)
    return false if post && post.author_id == 0

    self == post.author
  end
end
