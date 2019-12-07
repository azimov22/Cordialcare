class NonMember < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number
  has_many :buyers, as: :buyer, class_name: "Sale", foreign_key: "buyer_id"
  before_validation :purify_phone_number

  def purify_phone_number
    self.phone_number = self.phone_number.tr('^0-9', '')
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
