class AddIdsToAll < ActiveRecord::Migration
  def change
  	add_column :boards, :consumer_id, :integer
  	add_column :boards, :provider_id, :integer
  	add_column :cards, :board_id, :integer
  	add_column :consumers, :provider_id, :integer
  end
end
