class CreateNonMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :non_members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.timestamps
    end
    remove_column :sales, :buyer_id
    add_column :sales, :buyer_id, :integer
    add_column :sales, :buyer_type, :string
  end
end
