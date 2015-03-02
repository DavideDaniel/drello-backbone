class Consumer < ActiveRecord::Base

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  belongs_to :provider
  has_many :issues
  has_many :likes
  has_many :shared_boards

  has_secure_password

end
