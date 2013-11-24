class Comment < ActiveRecord::Base
  belongs_to :post,     counter_cache: true
  belongs_to :viewpoint
  has_many   :likes,    as: :likable
  has_many   :dislikes, as: :dislikable

  validates :body, length: { maximum: 300 }, presence: true
end
