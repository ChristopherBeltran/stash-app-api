class RemoveCategoryColumnFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :category
  end
end
