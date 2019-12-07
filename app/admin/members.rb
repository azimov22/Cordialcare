ActiveAdmin.register Member do

  permit_params :username, :email,
                :first_name, :last_name,
                :birthday, :address, :marital_status,
                :member_role_id, :team_id, :phone_number,
                :gender, :address, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :membership_id
    column :first_name
    column :last_name
    column :username
    column :role
    column :team
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :birthday, start_year: 1950
      f.input :email
      f.input :phone_number, input_html: { data: { mask: '+7 (000) 000-00-00' }}
      f.input :member_role_id, as: :select2, collection: MemberRole.all.map{ |role| [role.name, role.id]}
      f.input :team_id, as: :select2, collection: Team.all.map{ |entity| [entity.name, entity.id] }
      f.input :gender, as: :select2, collection: ['Male', 'Female']
      f.input :marital_status, as: :select2, collection: ['Married', 'Widowed', 'Separated', 'Divorced', 'Single']
      f.input :address
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end