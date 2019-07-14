class CreateStashArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :stash_articles do |t|
      t.integer :stash_id
      t.integer :article_id
    end
  end
end
