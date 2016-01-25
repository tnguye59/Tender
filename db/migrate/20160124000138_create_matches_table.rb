class CreateMatchesTable < ActiveRecord::Migration
  def change
  	drop_table :matches
    create_table :matches do |t|
    	t.references :user, index: true
    	t.references :match, index: true
    	t.timestamps
    end
  end
end
