class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name
    end
  end
end
