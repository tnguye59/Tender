class ChangePostId < ActiveRecord::Migration
  def change
  	rename_column :messages, :post_id, :count
  end
end
