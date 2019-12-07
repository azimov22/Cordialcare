class ChangeMembersTable < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :username, :string, null: true
    change_column :members, :encrypted_password, :string, null: true
    change_column :members, :member_role_id, :string, null: true
  end
end
