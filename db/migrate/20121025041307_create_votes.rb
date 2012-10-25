class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up
      t.references :user
      t.references :meaning

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :meaning_id
  end
end
