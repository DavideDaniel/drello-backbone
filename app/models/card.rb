class Card < ActiveRecord::Base
	belongs_to :provider
	belongs_to :board
	
  def to_builder
    Jbuilder.new do |card|
      card.(self, :name, :url)
    end
  end


end
