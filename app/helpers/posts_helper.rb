module PostsHelper
  def post_body(post)
    if post.deleted?
      t('messages.post_deleted_by_user')
    else
      post.body
    end
  end
end
