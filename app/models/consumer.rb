class Consumer < ActiveRecord::Base
  validates :email, :session_token, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  as_enum :gender, :null => 0, :female => 1, :male => 2 #use enumerator to reduce storage, join complexity & cheap values constraints

  belongs_to :provider
  has_many :issues
  has_many :shared_boards

  has_secure_password

end
