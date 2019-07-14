class Create < ActiveRecord::Migration[5.2]
  def change
    create_table :streams do |t|
      t.integer :user_id
      t.datetime :created_at
    end
  end
end
