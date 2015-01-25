class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :article_id
      t.integer :parent_id
      t.integer :user_id
      t.references :user
      t.references :article
      t.timestamps
    end
  end
end
