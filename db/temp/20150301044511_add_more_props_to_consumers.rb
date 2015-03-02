class AddMorePropsToConsumers < ActiveRecord::Migration
  def change
  	add_column :consumers, :birthday, :date
  	add_column :consumers, :gender_cd, :integer
  end
end
