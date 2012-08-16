class CreateHomePageFeatures < ActiveRecord::Migration
  def change
    create_table :home_page_features do |t|
      t.string :title
      t.text :body
      t.string :style
      t.boolean :publish

      t.timestamps
    end
  end
end
