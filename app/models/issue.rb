class Issue < ActiveRecord::Base
  belongs_to :list
  belongs_to :card
  belongs_to :consumer
end
