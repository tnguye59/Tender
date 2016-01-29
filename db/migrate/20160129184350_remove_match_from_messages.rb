class RemoveMatchFromMessages < ActiveRecord::Migration
  def change
  	remove_column :messages, :match_id
  end
end
