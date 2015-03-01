class Board < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  has_many :shared_boards, dependent: :destroy
  has_many :viewers, through: :shared_boards, source: :provider
  belongs_to :provider
  belongs_to :consumer

  def is_shared?(consumer)
    true if consumer.id == self.consumer_id
    shared_boards.where(consumer_id: consumer.id).exists?
    board.(self, :name, :url)
  end
end
