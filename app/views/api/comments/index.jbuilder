json.comments @comments do |comment|
  json.(comment, :id, :relative_id, :body, :created_at)
  json.viewpoint_code comment.viewpoint.code

  json.links do
    json.post comment.post_id
  end
end
