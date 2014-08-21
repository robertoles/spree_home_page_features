class AddTaxonIdToHomePageFeatures < ActiveRecord::Migration
  def change
    add_column :spree_home_page_features, :taxon_id, :integer
    add_index :spree_home_page_features, :taxon_id
  end
end
