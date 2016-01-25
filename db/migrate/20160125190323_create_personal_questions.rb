class CreatePersonalQuestions < ActiveRecord::Migration
  def change
    create_table :personal_questions do |t|
      t.text :q1
      t.text :q2
      t.text :q3
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
