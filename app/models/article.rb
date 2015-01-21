class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :comments
  has_many :article_tags
  has_many :tags, through: :article_tags
end
