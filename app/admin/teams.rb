ActiveAdmin.register Team do
  permit_params :name, :location_id

  index do
    column :name
    column "Location" do |l|
      location = Location.find(l.location_id)
      location.full_location
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :location_id, as: :select2, collection: Location.all.map{|l| [l.full_location, l.id]}
    end
    f.actions
  end
end