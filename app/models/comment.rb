class Comment < ActiveRecord::Base
  belongs_to :viewpoint
  belongs_to :post, counter_cache: true
end
