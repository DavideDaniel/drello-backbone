class Consumer < ActiveRecord::Base
	belongs_to :provider
	has_many :boards

	has_secure_password
end
