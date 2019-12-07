class Team < ApplicationRecord
  has_many :members, inverse_of: :team
  has_many :sales, inverse_of: :team
  belongs_to :location
  before_save :generate_team_name

  private

  def generate_team_name
    count =  Team.all.where(location: self.location).count
    self.name = "#{self.location.code_country}#{self.location.code_city}##{count+1}"
  end
end
