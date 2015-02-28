class AddPropsToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :name, :text
  	add_column :cards, :url, :text
  end
end
