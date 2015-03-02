class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :name
      t.date :birthday
      t.string :email
      t.string :password_digest
      t.integer :provider_id

      t.timestamps null: false
    end

    add_index :consumers, :email
  end
end
