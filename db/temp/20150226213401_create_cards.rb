class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.integer :board_id, null: false
      t.text :url
      t.float :ord, default: 0

      t.timestamps null: false
    end

    add_index :cards, :board_id
  end
end
