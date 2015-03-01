class CreateSharedBoards < ActiveRecord::Migration
  def change
    create_table :shared_boards do |t|

      t.timestamps null: false
    end
  end
end
