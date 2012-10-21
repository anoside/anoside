class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates :body, length: { maximum: 500 }, presence: true


  def set_title!
    self.title = body.rstrip.split(/\r?\n/).first.truncate(45)

    self
  end
end
