json.created_at time_ago_in_words(@comment.created_at)
json.(@comment, :body, :updated_at)
