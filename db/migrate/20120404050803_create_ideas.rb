class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :content
      t.references :topic

      t.timestamps
    end
    add_index :ideas, :topic_id
  end
end
