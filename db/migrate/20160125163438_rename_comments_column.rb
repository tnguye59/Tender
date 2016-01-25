class RenameCommentsColumn < ActiveRecord::Migration
  def change
  	rename_column :messages, :comment, :message
  end
end
