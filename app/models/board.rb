class Board < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :shared_boards, dependent: :destroy
  has_many :viewers, through: :shared_boards, source: :consumer
  belongs_to :provider


  def is_shared?(consumer)
    true if consumer.id == self.consumer_id
    shared_boards.where(consumer_id: consumer.id).exists?
  end
end
