class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :trelloName

      t.timestamps null: false
    end

    add_index :providers, :email
    add_index :providers, :session_token
  end
end

