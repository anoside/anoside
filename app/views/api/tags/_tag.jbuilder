json.name tag.name
json.followed user_signed_in? ? current_user.followed?(tag) : false
