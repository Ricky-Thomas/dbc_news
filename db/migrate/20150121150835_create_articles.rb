class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title
      t.string  :url
      t.integer :votes
      t.references :user
      t.references :category
      t.timestamps
    end
  end
end
