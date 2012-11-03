class Post < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :recent_comments, class_name: 'Comment', order: 'created_at DESC', limit: 5

  validates :body, length: { maximum: 500 }, presence: true

  acts_as_ordered_taggable


  def set_title!
    self.title = body.rstrip.split(/\r?\n/).first.truncate(45)

    self
  end

  def has_unviewable_comments?
    comments.count > 5
  end
end
