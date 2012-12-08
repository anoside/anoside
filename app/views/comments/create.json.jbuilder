json.comment_user_color @comment.comment_user_color.color.name
json.created_at time_ago_in_words(@comment.created_at)
json.(@comment, :relative_id, :body, :updated_at)
