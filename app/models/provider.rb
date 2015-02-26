class Provider < ActiveRecord::Base
	has_many :consumers
	has_many :boards
end
