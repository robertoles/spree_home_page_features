class AddProductIdToHomePageFeatures < ActiveRecord::Migration
  def change
    add_column :spree_home_page_features, :product_id, :integer
    add_index :spree_home_page_features, :product_id
  end
end
