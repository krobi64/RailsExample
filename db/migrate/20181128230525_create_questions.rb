class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :question_id
      t.string :tags
      t.integer :score
      t.boolean :is_answered
      t.integer :answer_count
      t.datetime :creation_date
      t.string :link
      t.string :title
    end

    add_index :questions, :question_id, unique: true
    add_index :questions, :score
  end
end
