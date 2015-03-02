class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.integer :provider_id, null: false

      t.timestamps null: false
    end

    add_index :boards, :provider_id
  end
end
