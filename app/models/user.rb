class User < ActiveRecord::Base
  attr_accessible :accept_language_id, :email, :password, :password_confirmation,
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


  def owns_post?(post)
    return false if post && post.user_id == 0

    self == post.user
  end

  def make_viewpoint(post, original: false)
    viewpoint = Viewpoint.where(post_id: post.id, user_id: id).first

    if viewpoint.blank?
      code = SecureRandom.urlsafe_base64(8)
      data = { post_id: post.id, user_id: id, code: code, original: original }

      viewpoint = Viewpoint.create(data)
    end

    viewpoint
  end
end
