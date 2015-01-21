class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :password_digest
      t.integer :score
      t.string  :phase
      t.string  :city
      t.string  :cohort
      t.string  :pic_url
      t.string  :facebook_url
      t.string  :linkedin_url
      t.string  :twitter_url
      t.string  :github_url
      t.string  :blog_url
      t.timestamps
    end
  end
end
