module PostsHelper
  def post_body(post)
    if post.deleted?
      t('messages.post_deleted_by_user')
    else
      simple_format(post.body)
    end
  end
end
