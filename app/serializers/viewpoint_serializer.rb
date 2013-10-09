class ViewpointSerializer < ActiveModel::Serializer
  has_one :post, embed: :id, key: :post
  attributes :code, :id
end
