class Meaning < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
  attr_accessible :content, :word_id
  validates :content, presence: true, length: { maximum: 500 }
  validate :user_must_be_in_database

  def vote_up user
  end

  def vote_down user
  end

  def remove_vote user
  end

  private

  def user_must_be_in_database
    user = nil
    begin
        user = User.find user_id
    rescue
    end
    errors.add(:user_id, " not found") unless user
  end
end
