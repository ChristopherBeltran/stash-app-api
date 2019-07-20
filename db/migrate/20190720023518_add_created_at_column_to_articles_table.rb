class AddCreatedAtColumnToArticlesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :created_at, :datetime
  end
end
