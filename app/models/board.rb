class Board < ActiveRecord::Base
	has_many :cards
	belongs_to :provider
	belongs_to :consumers

	def to_builder
    Jbuilder.new do |board|
      board.(self, :name, :url)
    end
  end
end
