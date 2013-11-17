class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :viewpoint

  validates :body, length: { maximum: 300 }, presence: true
end
