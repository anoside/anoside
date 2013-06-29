json.viewpoint_code @comment.viewpoint.code
json.created_at @comment.created_at
json.(@comment, :relative_id, :body)
