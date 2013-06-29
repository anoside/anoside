class Viewpoint < ActiveRecord::Base
  attr_accessible :code, :original, :post_id, :user_id

  belongs_to :user
end
