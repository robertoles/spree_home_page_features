class AddTaxonIdToHomePageFeatures < ActiveRecord::Migration
  def change
    add_column :home_page_features, :taxon_id, :integer
    add_index :home_page_features, :taxon_id
  end
end
