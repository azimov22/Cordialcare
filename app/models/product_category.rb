class ProductCategory < ApplicationRecord
  has_many :products
  validates_presence_of :name
  has_ancestry orphan_strategy: :rootify
  before_save :cache_ancestry

  def cache_ancestry
    self.names_depth_cache = path.map(&:name).join('/')
  end

  def short_name
    a = path.map{|a| a.name[0]}
    a.pop
    a.join("")
  end

  def ancestry_id
    "#{self.ancestry}/#{self.id}"
  end
end
