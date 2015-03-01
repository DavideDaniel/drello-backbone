class Issue < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :provider
  belongs_to :card
end
