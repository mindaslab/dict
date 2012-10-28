class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :meaning
  attr_accessible :up
  validate :must_not_be_a_duplicate, on: :create

  private

  def must_not_be_a_duplicate
  	vote = Vote.where("user_id =  #{user.id} and meaning_id = #{meaning.id}")
  	errors.add(:user_id, " has already voted")
  end
end
