class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :stashes, :name, :string
    add_column :stashes, :created_at, :datetime
  end
end
