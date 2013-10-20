json.id post.id
json.viewpoint_code post.viewpoint.code
json.body post.deleted? ? t('messages.this_post_deleted_by_user') : post.body
json.comments_count post.comments_count
json.likes_count post.likes_count
json.dislikes_count post.dislikes_count
json.liked user_signed_in? ? current_user.liked?(post) : false
json.disliked user_signed_in? ? current_user.disliked?(post) : false
json.own user_signed_in? ? current_user.own_post?(post) : false
json.deleted_at post.deleted_at
json.created_at post.created_at
