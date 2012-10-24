class AddUserIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :user_id, :integer, null: false, default: 0
    add_index :words, :user_id
  end
end
