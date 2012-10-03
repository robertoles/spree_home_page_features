class CreateHomePageFeatures < ActiveRecord::Migration
  def change
    create_table :home_page_features do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.string :style
      t.boolean :publish, :null => false, :default => false

      t.timestamps
    end

    add_index :home_page_features, :publish
  end
end
