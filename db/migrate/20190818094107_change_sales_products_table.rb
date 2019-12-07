class ChangeSalesProductsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :purchasing_price_kzt
    remove_column :products, :price_period
    remove_column :products, :freight
    remove_column :products, :import_duty
    remove_column :products, :handling_charge
    remove_column :products, :vat
    remove_column :products, :name_rus
    rename_column :products, :name_eng, :name
    rename_column :products, :membership_price_kzt, :sales_price
  end
end
