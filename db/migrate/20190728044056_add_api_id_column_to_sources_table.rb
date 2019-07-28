class AddApiIdColumnToSourcesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :api_id, :string
  end
end
