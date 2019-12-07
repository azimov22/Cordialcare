class SalesProduct < ApplicationRecord
  belongs_to :productable, polymorphic: true, optional: true
  belongs_to :product, inverse_of: :sales_products

end
