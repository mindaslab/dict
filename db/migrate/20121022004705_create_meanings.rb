class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.text :content
      t.references :word

      t.timestamps
    end
    add_index :meanings, :word_id
  end
end
