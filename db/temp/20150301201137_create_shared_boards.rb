class CreateSharedBoards < ActiveRecord::Migration
  def change
    create_table :shared_boards do |t|
      t.integer :consumer_id, null: false
      t.integer :board_id, null: false

      t.timestamps null: false
    end

    add_index :shared_boards, [:consumer_id, :board_id], unique: true
  end
end
