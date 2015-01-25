class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :comments
  has_many :article_tags
  has_many :tags, through: :article_tags

  def parse_tags!(tags_str)
    self.tags.clear
    tags_str.split(',').map(&:strip).uniq.each do |tag_str|
      tag = Tag.where(name: tag_str).first_or_create
      self.tags << tag
    end
  end

  def tags_str
    self.tags.map(&:name).join(", ")
  end
end
