ActiveAdmin.register Product do
  permit_params :name_eng, :name_rus, :product_category_id, :brand_id,:membership_price_kzt,
                :unit_price, :basic_commission, :total_commission

  index do
    selectable_column
    id_column
    column :name_eng
    column :category
    column :brand
    column :unit_price
    column :membership_price_kzt
    column "Commission (%)", :basic_commission
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name_eng, label: "Product name (english)"
      f.input :product_category_id, as: :select2, collection: ProductCategory.order(:names_depth_cache).map { |c| ["#{c.names_depth_cache} " + c.name,c.id] }
      f.input :brand_id, as: :select2, collection: Brand.all.map{|b| [b.name, b.id]}
      f.input :unit_price
      f.input :basic_commission, label: "Commission(%)"
      f.input :total_commission, label: "Total Commission(%)"
      f.input :membership_price_kzt
    end
    f.actions
  end
end