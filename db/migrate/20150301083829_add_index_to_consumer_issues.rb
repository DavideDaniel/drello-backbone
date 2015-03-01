class AddIndexToConsumerIssues < ActiveRecord::Migration
   def change
    add_index  :consumers, :issues, using: 'gin'
  end
end