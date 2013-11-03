class User < ActiveRecord::Base
  attr_accessor :accept_language_id

  has_many :dislikes,   dependent: :destroy
  has_many :follows,    dependent: :destroy
  has_many :likes,      dependent: :destroy
  has_many :tags,       through: :follows
  has_one  :preference, dependent: :destroy

  validates :password, presence: true
  validates :username, format: { with: /\A[A-Za-z0-9_]+\z/ }, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable, :rememberable, :trackable

  after_create do
    preference = Preference.create(user_id: self.id)
    LanguagesPreference.create(language_id: accept_language_id, preference_id: preference.id)
  end


  def own_post?(post)
    !post.deleted_at? && self == post.viewpoint.user
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

  def liked?(likable)
    likes.where(likable: likable).present?
  end

  def disliked?(dislikable)
    dislikes.where(dislikable: dislikable).present?
  end

  def followed?(tag)
    !!tags.include?(tag)
  end

  def follow(tag)
    tags << tag unless followed?(tag)
  end

  def unfollow(tag)
    tags.delete(tag) if followed?(tag)
  end

  def like_posts
    Post.joins(:likes).where(likes: { user_id: id })
  end

  def dislike_posts
    Post.joins(:dislikes).where(dislikes: { user_id: id })
  end
end
