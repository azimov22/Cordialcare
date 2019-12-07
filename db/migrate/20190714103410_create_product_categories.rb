class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.string :name, null: false
      t.string :ancestry
      t.string :names_depth_cache
      t.timestamps
    end
    add_index :product_categories, :ancestry
  end
end
