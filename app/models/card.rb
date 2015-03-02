class Card < ActiveRecord::Base
  belongs_to :list
  has_many :likes, dependent: :destroy
  has_many :issues, dependent: :destroy

  default_scope { order(:order) }
end