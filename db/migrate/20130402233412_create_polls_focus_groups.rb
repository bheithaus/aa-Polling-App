class CreatePollsFocusGroups < ActiveRecord::Migration
  def change
    create_table :polls_focus_groups do |t|
      t.integer :focus_group_id
      t.integer :poll_id

      t.timestamps
    end

    add_index :polls_focus_groups, [:poll_id, :focus_group_id]
  end
end
