class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :articles
  has_many :commented_articles, through: :comments, source: :article

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /[a-zA-Z]*[1-9]*@[a-z]*.[a-z]{3}/}

  def may_edit?(item)
    item.user_id == self.id
  end
end
