class AddLocationFieldsAndAddMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :membership_id, :string
    add_column :locations, :code_country, :string
    add_column :locations, :code_city, :string
  end
end
