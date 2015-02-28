class Consumer < ActiveRecord::Base
	has_one :provider
	has_many :boards

	has_secure_password
end
