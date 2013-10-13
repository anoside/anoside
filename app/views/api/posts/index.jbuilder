json.posts @posts do |post|
  json.partial! 'post', post: post

  # json.comments post.comments.last(5) do |comment|
  #   json.comment_user_code comment.comment_user_code.code
  #   json.created_at time_ago_in_words(comment.created_at)
  #   json.(comment, :relative_id, :body)
  # end

  # json.tags post.tags do |tag|
  #   json.(tag, :name)
  # end
end
