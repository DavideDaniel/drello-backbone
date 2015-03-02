class Like < ActiveRecord::Base
  belongs_to :card
  belongs_to :consumer
end
