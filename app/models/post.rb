class Post < ActiveRecord::Base
  extend Enumerize

  belongs_to :language
  has_many   :comments
  has_many   :likes, as: :likable
  has_many   :dislikes, as: :dislikable
  has_one    :viewpoint, -> { where original: true }

  validates :body, length: { maximum: 500 }, presence: true

  scope :filter, -> params {
    scope = self

    if params[:tag].present?
      scope = scope.joins(:tags).where('tags.name' => params[:tag])
    end

    scope
  }

  acts_as_ordered_taggable

  enumerize :deleted_by, in: [:user, :admin]

  before_create :pick_tags


  # Overwrite Active Record's destroy method for soft deletion.
  # I can't use rails3_acts_as_paranoid gem because acts-as-taggable-on gem
  # removes dependent tags forcefully.
  def destroy
    update_attributes(deleted_by: :user, deleted_at: Time.now)
  end

  def deleted?
    deleted_at.present?
  end

  def set_title!
    self.title = body.rstrip.split(/\r?\n/).first.truncate(45)

    self
  end

  def set_language!
    code = case CLD.detect_language(body)[:code]
      when 'en' then 'en'
      when 'ja' then 'ja'
      else 'other'
      end

    self.language = Language.find_by_code(code)

    self
  end

  private

  def pick_tags
    self.tag_list = body.scan(/\#[[:alnum:]]+/).map { |tag_name| tag_name.delete('#') }
  end
end
