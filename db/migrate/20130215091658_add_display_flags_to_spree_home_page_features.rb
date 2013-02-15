class AddDisplayFlagsToSpreeHomePageFeatures < ActiveRecord::Migration
  def change
    add_column :home_page_features, :display_title, :boolean, default: true
    add_column :home_page_features, :display_body, :boolean, default: true
  end
end
