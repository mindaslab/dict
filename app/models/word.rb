class Word < ActiveRecord::Base
  has_many :meanings
  belongs_to :user
  attr_accessible :content
  validates :content, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 80 }
end
