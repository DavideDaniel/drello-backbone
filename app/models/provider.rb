class Provider < ActiveRecord::Base
  validates :email, :session_token, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :consumers
  has_many :boards
  has_many :shared_boards
  has_many :issues

  has_secure_password
end
