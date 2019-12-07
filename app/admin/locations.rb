ActiveAdmin.register Location do
  permit_params :city, :country, :code_country, :code_city

  form do |f|
    f.inputs do
      f.input :city
      f.input :country, as: :string
      f.input :code_country, as: :string
      f.input :code_city, as: :string
    end
    f.actions
  end
end