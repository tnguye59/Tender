class ChangeNameGeneralQ < ActiveRecord::Migration
  def change
  	rename_table :general_qs, :general_questions
  end
end
