class Meaning < ActiveRecord::Base
  belongs_to :word
  attr_accessible :content
end
