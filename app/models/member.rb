class Member < ApplicationRecord

  devise :database_authenticatable, :trackable, :lockable, :rememberable, :validatable, authentication_keys: [:username]

  belongs_to :role, class_name: 'MemberRole', foreign_key: 'member_role_id'
  belongs_to :team
  has_many :sellers, class_name: "Sale", foreign_key: "seller_id"
  has_many :buyers,as: :buyer, class_name: "Sale", foreign_key: "buyer_id"

  before_save :check_team_leaders
  before_validation :generate_membership_id
  before_validation :purify_phone_number
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :phone_number
  validates_uniqueness_of :phone_number
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :membership_id
  validates_uniqueness_of :membership_id

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def description
    "#{self.role.name} #{self.team.name}"
  end

  def purify_phone_number
    self.phone_number = self.phone_number.tr('^0-9', '')
  end

  def is_bc_leader?
    role.name == "Beauty Consultant Leader"
  end

  def is_team_manager?
    role.name == "Team manager"
  end

  def is_junior_director?
    role.name == "Junior Director"
  end

  def is_senior_director?
    role.name == "Senior Director"
  end

  def generate_membership_id
    location = Location.find_by(id: self.team.location.id)
    member = Member.find_by(membership_id: self.membership_id)
    if member.present?
      self.membership_id = self.membership_id
    elsif Member.all.count == 0
      digits = 0
      self.membership_id = "#{location.code_country}#{location.code_city}#{self.birthday.strftime("%d_%m_%Y")}#{digits}"
    else
      digits = Member.all.count + 1
      self.membership_id = "#{location.code_country}#{location.code_city}#{self.birthday.strftime("%d_%m_%Y")}#{digits}"
    end
  end

  private
  def check_team_leaders
    @count = 0
    Member.where(team: self.team.id).each do |member|
      if member.is_bc_leader?
        @count = @count + 1
      end
    end
    if @count > 1
      self.errors.add(:role, "This team has a Beauty Consultant Leader. Choose another role.")
    end
  end
end
