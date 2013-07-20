json.posts @posts do |post|
  json.id post.id
  json.viewpoint_code post.viewpoint.code
  json.body post_body(post)
  json.comments_count post.comments_count
  json.deleted_at post.deleted_at
  json.created_at post.created_at

  json.links do
    json.comments post.comments.pluck(:id)
    json.tags post.tags.pluck(:id)
  end
end
