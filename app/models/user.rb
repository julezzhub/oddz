class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_friendship
  has_many :bets
  validates_presence_of :username, :avatar
  validates_uniqueness_of :username, message: "exists already"
  validates :username, format: { with: /(?=.{6,20})[a-zA-Z0-9._]/, message: "must be 6-20 characters long and can only contain letters, numbers, . and _" }

  mount_uploader :avatar, PhotoUploader
  monetize :balance_cents

  def friend_names
    names = []
    friends.each do |friend|
      names << User.find(friend.id).username
    end
    names
  end
end
