class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_friendship
  has_many :bets
  has_many :transactions
  validates_presence_of :username, :avatar
  validates_uniqueness_of :username, message: "exists already"
  validates :username, format: { with: /(?=.{3,20})[a-zA-Z0-9._]/, message: "must be 6-20 characters long and can only contain letters, numbers, . and _" }
  has_many :notifications, as: :notifiable

  # has_one :wallet


  mount_uploader :avatar, PhotoUploader
  monetize :balance_cents


  # def on_friendship_created(friendship)
  #   notification = Notification.new(user_id: friendship.friend_id, friend_id: friendship.friendable_id, category: "New Friend Request")
  #   #<HasFriendship::Friendship id: 1, friendable_type: "User", friendable_id: 12, friend_id: 11, created_at: "2019-12-09 12:34:15", updated_at: "2019-12-09 12:34:15", blocker_id: nil, status: "pending">
  #   notification.save

  #   p notification
  #   p ".............................."
  # end

  # def on_friendship_accepted(friendship)
  #   notification = Notification.new(user_id: friendship.friendable_id, category: "Accepted Friend Request")
  #   notification.save
  # end

  def friend_names
    names = []
    friends.each do |friend|
      names << User.find(friend.id).username
    end
    names
  end

end
