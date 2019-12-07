class Brand < ApplicationRecord
  has_many :products, inverse_of: :brand
  validates_uniqueness_of :name
  validates_presence_of :name
end
