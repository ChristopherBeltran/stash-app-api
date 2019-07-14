class CreateStreamSources < ActiveRecord::Migration[5.2]
  def change
    create_table :stream_sources do |t|
      t.integer :stream_id
      t.integer :source_id
    end
  end
end
