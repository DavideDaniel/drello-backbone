class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :card_id
      t.integer :consumer_id

      t.timestamps null: false
    end

    add_index :issues, [:card_id, :consumer_id], unique: true
  end
end
