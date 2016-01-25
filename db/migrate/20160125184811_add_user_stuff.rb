class AddUserStuff < ActiveRecord::Migration
  def change
  	add_column :users, :height, :integer
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :nationality, :string
  end
end
