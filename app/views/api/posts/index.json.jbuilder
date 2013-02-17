json.array!(@posts) do |post|
  json.id post.id
  json.user_id post.user_id
  json.body post_body(post)
  json.deleted_at post.deleted_at
  json.created_at time_ago_in_words(post.created_at)

  json.comments post.comments.last(5) do |comment|
    json.comment_user_code comment.comment_user_code.code
    json.created_at time_ago_in_words(comment.created_at)
    json.(comment, :relative_id, :body)
  end

  json.tags post.tags do |tag|
    json.(tag, :name)
  end
end
