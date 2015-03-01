class SharedBoard < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :provider
  belongs_to :board
end