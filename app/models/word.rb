class Word < ActiveRecord::Base
  has_many :meanings
  attr_accessible :content
  validates :content, presence: true, uniqueness: true
end
