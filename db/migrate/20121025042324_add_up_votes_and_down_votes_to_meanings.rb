class AddUpVotesAndDownVotesToMeanings < ActiveRecord::Migration
  def change
    add_column :meanings, :up_votes, :interger, default: 0, null: false
    add_column :meanings, :down_votes, :integer, default: 0, null: false
  end
end
