class Provider < ActiveRecord::Base
  has_many :consumers
  has_many :boards
  has_secure_password

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end