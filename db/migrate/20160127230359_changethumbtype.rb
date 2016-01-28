class Changethumbtype < ActiveRecord::Migration
  def change
  	remove_column :matches, :thumb
  end
end
