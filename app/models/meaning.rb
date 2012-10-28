class Meaning < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
  attr_accessible :content, :word_id
  validates :content, presence: true, length: { maximum: 500 }

  def vote_up user
  end

  def vote_down user
  end

  def remove_vote user
  end
end
