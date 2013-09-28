class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :body, :comments_count
end
