json.array!(@posts) do |post|
  json.body post_body(post)
  json.deleted_at post.deleted_at
end
