class AddColumntoComment < ActiveRecord::Migration
  def change
  	 add_column :messages, :post_id, :integer
  end
end
