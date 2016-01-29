class MatchedIdToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :matched_id, :integer
  end
end
