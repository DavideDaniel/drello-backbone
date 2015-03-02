class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.integer :provider_id

      t.timestamps null: false
    end

    add_index :consumers, :email
    add_index :consumers, :session_token
  end
  end
