class Post < ActiveRecord::Base
  extend Enumerize

  attr_accessible :body, :deleted_at, :deleted_by, :title

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :recent_comments, class_name: 'Comment', order: 'created_at DESC', limit: 5

  validates :body, length: { maximum: 500 }, presence: true

  acts_as_ordered_taggable
  enumerize :deleted_by, in: [:author, :admin]


  # Overwrite Active Record's destroy method for soft deletion.
  # I can't use rails3_acts_as_paranoid gem because acts-as-taggable-on gem
  # removes dependent tags forcefully.
  def destroy
    update_attributes(deleted_by: :author, deleted_at: Time.now)
  end

  def deleted?
    deleted_at.present?
  end

  def set_title!
    self.title = body.rstrip.split(/\r?\n/).first.truncate(45)

    self
  end

  def has_unviewable_comments?
    comments.count > 5
  end
end
