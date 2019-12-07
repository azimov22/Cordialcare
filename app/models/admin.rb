class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable, :lockable, :rememberable,
         authentication_keys: [:username]

  validates_presence_of :username
  validates_uniqueness_of :username
end
