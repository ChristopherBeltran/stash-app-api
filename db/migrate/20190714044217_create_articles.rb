class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :category
      t.string :url
      t.text :content
      t.integer :source_id
    end
  end
end
