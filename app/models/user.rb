class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  validates :password, presence: true
  validates :username, format: { with: /\A[A-Za-z0-9_]+\z/ }, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable, :rememberable, :trackable

  
  def owns_post?(post)
    return false if post && post.author_id == 0

    self == post.author
  end
end
