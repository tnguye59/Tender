class Addthumbagain < ActiveRecord::Migration
  def change
  	add_column :matches, :thumb, :integer
  end
end
