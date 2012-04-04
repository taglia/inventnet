class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user
      t.references :topic

      t.timestamps
    end
    add_index :roles, :user_id
    add_index :roles, :topic_id
  end
end
