class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :viewpoint
  belongs_to :post, counter_cache: true
end
