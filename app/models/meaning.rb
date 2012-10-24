class Meaning < ActiveRecord::Base
  belongs_to :word
  attr_accessible :content, :word_id
  validates :content, presence: true
end
