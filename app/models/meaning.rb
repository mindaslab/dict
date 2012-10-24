class Meaning < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
  attr_accessible :content, :word_id
  validates :content, presence: true
end
