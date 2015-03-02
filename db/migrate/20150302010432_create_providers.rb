class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :trelloName

      t.timestamps null: false
    end

    add_index :providers, :email
  end
end

