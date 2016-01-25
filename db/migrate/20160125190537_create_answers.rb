class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :a1
      t.text :a2
      t.text :a3
      t.references :personal_question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
