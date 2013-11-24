json.(comment, :body, :created_at, :dislikes_count, :id, :likes_count, :number, :post_id)
json.disliked       user_signed_in? ? current_user.disliked?(comment) : false
json.liked          user_signed_in? ? current_user.liked?(comment) : false
json.viewpoint_code comment.viewpoint.code
