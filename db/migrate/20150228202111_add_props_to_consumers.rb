class AddPropsToConsumers < ActiveRecord::Migration
  def change
  	add_column :consumers, :name, :text
  	add_column :consumers, :email, :text
  	add_column :consumers, :password_digest, :text
  	add_column :consumers, :provider_id, :integer
  end
end
