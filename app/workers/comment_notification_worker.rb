class CommentNotificationWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(post_id, comment_id)
    post = Post.find(post_id)
    comment = Comment.find(comment_id)

    NotificationMailer.send_mail(post, comment)
  end
end