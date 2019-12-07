class Sale < ApplicationRecord

  enum status: SaleStatus.all.map{ |s| [s.to_sym, s.to_sym.to_s] }.to_h, _suffix: true
  belongs_to :type, class_name: "SaleType", foreign_key: "sale_type_id"
  has_many :sales_products, as: :productable, dependent: :destroy
  belongs_to :team, inverse_of: :sales
  belongs_to :seller, class_name: "Member"
  belongs_to :buyer, polymorphic: true

  validates_presence_of :status, :seller, :buyer, :type

  before_validation :set_status_to_new

  def status
    SaleStatus.new(read_attribute(:status)) if read_attribute(:status).present?
  end

  def set_status_to_new
    self.status = :new if read_attribute(:status).nil?
  end

  def member_profit
    self.sales_products.each do |sale_product|
      product = Product.find_by(id: sale_product.product_id)
      @profits = sale_product.amount.to_i * product.basic_commission.to_i / 100
    end
    @profits
  end
end
