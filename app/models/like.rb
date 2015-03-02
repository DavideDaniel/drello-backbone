class Like < ActiveRecord::Base
  validates :card, presence: true

  belongs_to :card
  belongs_to :consumer
end

