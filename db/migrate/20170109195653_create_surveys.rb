class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.integer "user_id"
      t.string "title", null: false
      t.timestamps
    end
  end
end
