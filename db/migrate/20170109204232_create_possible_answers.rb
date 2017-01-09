class CreatePossibleAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :possible_answers do |t|
      t.integer "question_id"
      t.text "content"
      t.integer "count"
      t.timestamps
    end
  end
end
