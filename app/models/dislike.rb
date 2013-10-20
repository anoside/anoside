class Dislike < ActiveRecord::Base
  belongs_to :dislikable, polymorphic: true, counter_cache: true
  belongs_to :user
end
