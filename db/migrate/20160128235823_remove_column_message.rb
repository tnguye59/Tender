class RemoveColumnMessage < ActiveRecord::Migration
  def change
  	remove_column :messages, :message
  end
end
