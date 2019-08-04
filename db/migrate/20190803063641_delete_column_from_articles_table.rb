class DeleteColumnFromArticlesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :created_at
  end
end
