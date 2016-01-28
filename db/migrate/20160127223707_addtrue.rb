class Addtrue < ActiveRecord::Migration
  def change
  	add_column :matches, :thumb, :boolean
  end
end
