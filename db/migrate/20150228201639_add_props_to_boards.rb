class AddPropsToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :title, :text
  end
end
