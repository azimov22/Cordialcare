class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :name_eng, null: false
      t.string :name_rus
      t.references :product_category
      t.references :brand
      t.integer :membership_price_kzt
      t.integer :purchasing_price_kzt
      t.date :price_period
      t.string :freight
      t.integer :import_duty
      t.integer :vat
      t.string :handling_charge
      t.string :unit_type
      t.integer :unit_price
      t.integer :basic_commission
      t.integer :total_commission
      t.timestamps
    end
  end
end
