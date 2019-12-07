class AccessToken < ApplicationRecord
  belongs_to              :user
  validates_presence_of   :token
  validates_uniqueness_of :token

  before_validation       :generate_token

  def generate_token
    return if self.token.present?

    loop do
      self.token = SecureRandom.hex(10)
      break token unless AccessToken.where(token: token).exists?
    end
  end
end
