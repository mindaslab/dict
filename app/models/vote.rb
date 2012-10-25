class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :meaning
  attr_accessible :up
end
