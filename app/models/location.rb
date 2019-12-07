class Location < ApplicationRecord
  validates_presence_of :city, :country
  has_many :teams
  has_many :members

  def full_location
    "#{country} #{city}"
  end
end
