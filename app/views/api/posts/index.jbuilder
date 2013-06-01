json.posts @posts do |post|
  json.id post.id
  json.user_id post.user_id
  json.body post_body(post)
  json.comments_count post.comments_count
  json.deleted_at post.deleted_at
  json.created_at post.created_at

  json.links do
    json.comments post.comments.pluck(:id)
  end

  json.tags post.tags do |tag|
    json.(tag, :name)
  end
end
