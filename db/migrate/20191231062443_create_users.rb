class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :password_digest, null:false
      t.string :password_salt, null: false
      t.string :name, null:false

      t.timestamps
    end
  end
end
