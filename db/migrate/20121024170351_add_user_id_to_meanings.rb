class AddUserIdToMeanings < ActiveRecord::Migration
  def change
    add_column :meanings, :user_id, :integer, null: false, default: 0
    add_index :meanings, :user_id
  end
end
