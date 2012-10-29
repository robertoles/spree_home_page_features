class AddProductIdToHomePageFeatures < ActiveRecord::Migration
  def change
    add_column :home_page_features, :product_id, :integer
    add_index :home_page_features, :product_id
  end
end
