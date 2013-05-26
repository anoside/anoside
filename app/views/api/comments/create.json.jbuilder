json.comment_user_code @comment.comment_user_code.code
json.created_at @comment.created_at
json.(@comment, :relative_id, :body)
