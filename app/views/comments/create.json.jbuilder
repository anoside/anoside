json.comment_user_code @comment.comment_user_code.code
json.created_at time_ago_in_words(@comment.created_at)
json.(@comment, :relative_id, :body, :updated_at)
