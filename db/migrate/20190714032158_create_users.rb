class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :name
      t.string :provider, :null => false, :default => "email"
      t.string :uid
      t.text :tokens                
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
      t.timestamps
    end
  end
end
