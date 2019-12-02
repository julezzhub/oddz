class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_friendship

  validates_presence_of :username, :avatar
  validates_uniqueness_of :username, message: "Username exists already"
  validates :username, format: { with: /(?=.{6,20})[a-zA-Z0-9._]/, message: "Username must be 6-20 characters long and can only contain letters, numbers, . and _" }

  monetize :balance_cents
end
