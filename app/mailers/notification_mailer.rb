class NotificationMailer < ActionMailer::Base
  default from: 'no-reply@anoside.com'

  def comment_on_post(comment_id)
    @comment = Comment.find(comment_id)
    @post = @comment.post

    mail(to: @post.viewpoint.user.setting.email, subject: t('notifications.comment_on_post.title'))
  end
end
