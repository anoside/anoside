module PostsHelper
  def post_body_tag(post)
    content_tag :div, class: 'body' + (post.deleted? ? ' deleted' : '') do
      if post.deleted?
        t('messages.post_deleted_by_author')
      else
        simple_format(post.body)
      end
    end
  end
end
