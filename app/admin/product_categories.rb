ActiveAdmin.register ProductCategory do
  permit_params :name, :ancestry
  sortable tree: true,
           max_levels: 0,
           protect_root: false,
           sorting_attribute: :name,
           parent_method: :parent,
           children_method: :children,
           roots_method: :roots,
           roots_collection: nil,
           sortable: true,
           collapsible: false,
           start_collapsed: false

  index :as => :sortable do
    label :name
    actions
  end

  form do |f|
    f.inputs "Product Categories", as: :sortable do
      f.input :name
      f.input :ancestry,
              as: :select2,
              collection: ProductCategory.order(:names_depth_cache).map { |c| ["#{c.names_depth_cache} " + c.name, c.ancestry_id]}
    end
    f.actions
  end
end