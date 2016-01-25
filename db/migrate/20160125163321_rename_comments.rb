class RenameComments < ActiveRecord::Migration
  def change
  	rename_table :comments, :messages
  end
end
