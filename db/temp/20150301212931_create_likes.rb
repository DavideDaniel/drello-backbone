class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :card_id, null: false
      t.integer :consumer_id, null: false
      t.boolean :done, default: false
      t.timestamps null: false
    end

    add_index :likes, :card_id
  end
end
