class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :respondent_id
      t.integer :choice_id

      t.timestamps
    end

    add_index :answers, [:respondent_id, :choice_id]
  end
end
