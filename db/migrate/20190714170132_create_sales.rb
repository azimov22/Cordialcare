class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :sale_type
      t.date :sale_date
      t.references :seller
      t.references :buyer
      t.references :team
      t.string :status
      t.timestamps
    end
    add_foreign_key :sales, :members, column: :seller_id, primary_key: :id
    add_foreign_key :sales, :members, column: :buyer_id, primary_key: :id
  end
end
