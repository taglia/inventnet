class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :abstract
      t.references :owner

      t.timestamps
    end
    add_index :topics, :owner_id
  end
end
