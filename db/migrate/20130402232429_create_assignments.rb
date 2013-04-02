class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :focus_group_id
      t.integer :user_id

      t.timestamps
    end

    add_index :assignments, [:user_id, :focus_group_id]
  end
end
