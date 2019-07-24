class AddDescriptionColumnToSourcesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :description, :text
  end
end
