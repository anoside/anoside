json.comments @comments do |comment|
  json.(comment, :id, :relative_id, :body, :created_at)
  json.comment_user_code comment.comment_user_code.code

  json.links do
    json.post comment.post_id
  end
end
