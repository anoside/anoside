class Post < ActiveRecord::Base
  extend Enumerize

  belongs_to :language
  has_many   :comments
  has_many   :likes,     as: :likable
  has_many   :dislikes,  as: :dislikable
  has_many   :taggings
  has_many   :tags,      through: :taggings
  has_one    :viewpoint, -> { where original: true }

  validates :body, length: { maximum: 300 }, presence: true

  scope :filter, -> params {
    scope = self

    if params[:tag].present?
      scope = scope.joins(:tags).where('tags.name' => params[:tag])
    end

    scope
  }

  enumerize :deleted_by, in: [:user, :admin]

  before_create :pick_tags


  # Overwrite Active Record's destroy method for soft deletion.
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

  def tag_list=(tags)
    tag_list = case tags.class.name
      when 'Array'  then tags
      when 'String' then tags.split(',')
      end
    tag_list = tag_list.map { |tag| tag.strip.delete('#') }

    self.tags = tag_list.map { |tag| Tag.where(name: tag).first_or_create }
  end

  private

  def pick_tags
    self.tag_list = body.scan(/\#[[:alnum:]]+/)
  end
end
