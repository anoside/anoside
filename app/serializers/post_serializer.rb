class PostSerializer < ActiveModel::Serializer
  has_one :viewpoint, embed: :id, key: :viewpoint
  attributes :body, :comments_count, :created_at, :id
end
