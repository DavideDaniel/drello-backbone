class Card < ActiveRecord::Base
  belongs_to :board
  has_many :issues, dependent: :destroy

  default_scope { order(:ord) }
end