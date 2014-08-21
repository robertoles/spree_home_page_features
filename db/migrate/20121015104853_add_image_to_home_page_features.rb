class AddImageToHomePageFeatures < ActiveRecord::Migration
  def change
    add_column :spree_home_page_features, :image_file_name, :string
    add_column :spree_home_page_features, :image_file_size, :integer
    add_column :spree_home_page_features, :image_content_type, :string
    add_column :spree_home_page_features, :image_updated_at, :datetime
  end
end
