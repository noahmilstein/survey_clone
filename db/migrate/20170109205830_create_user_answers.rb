class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.integer "submission_id"
      t.integer "question_id"
      t.string "value"
      t.timestamps
    end
  end
end
