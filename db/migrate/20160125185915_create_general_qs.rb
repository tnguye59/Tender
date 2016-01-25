class CreateGeneralQs < ActiveRecord::Migration
  def change
    create_table :general_qs do |t|
      t.string :city
      t.string :gender
      t.integer :max_age
      t.integer :min_age
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
