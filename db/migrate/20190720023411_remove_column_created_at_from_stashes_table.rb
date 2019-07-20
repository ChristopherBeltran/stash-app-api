class RemoveColumnCreatedAtFromStashesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :stashes, :created_at, :datetime
  end
end
