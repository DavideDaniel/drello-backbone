class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.integer :provider_id

      t.timestamps null: false
    end

    add_index :boards, :provider_id
  end
end
