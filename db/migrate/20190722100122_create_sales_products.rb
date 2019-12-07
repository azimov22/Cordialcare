class CreateSalesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_products do |t|
      t.references :productable, polymorphic: true, index: true
      t.references :product, null: false
      t.integer :quantity, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
