class NotificationMailer < ActionMailer::Base
  default from: 'no-reply@anoside.com'

  def send_mail(post, comment)
    @post = post
    @comment = comment

    mail(to: @post.user.email, subject: t('notifications.you_got_a_new_comment')).deliver
  end
end
