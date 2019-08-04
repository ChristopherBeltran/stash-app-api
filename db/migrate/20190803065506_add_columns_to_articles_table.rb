class AddColumnsToArticlesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :url_to_image, :string
    add_column :articles, :description, :string
    add_column :articles, :author, :string
    add_column :articles, :published_at, :string
  end
end
