class AddIssuesToConsumers < ActiveRecord::Migration
  def change
  	add_column :consumers, :issues, :string, array: true, default: '{}'
  end
end
