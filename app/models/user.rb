class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :giver_relationships, foreign_key: :giver_id, class_name: 'Friendship', source: 'friendship'
  has_many :givers, through: :giver_relationships, source: :giver

  has_many :receiver_relationships, foreign_key: :receiver_id, class_name: 'Friendship', source: 'friendship'
  has_many :receivers, through: :receiver_relationships, source: :receiver

  has_many :friendships, foreign_key: "giver_id"
  has_many :friendships, foreign_key: "receiver_id"

  def add_friend(user_id)
    receiver_relationships.create(giver_id: id, receiver_id: user_id)
  end

  def remove_friend(user_id)
    receiver_relationships.find_by(receiver_id: user_id).destroy
  end

  def is_friend?(user_id)
    friendship = Friendship.find_by(giver_id: id, receiver_id: user_id)
    return true if friendship
  end

  def friends
   User.join(:friendships).where(friendships: { giver: self })
   User.joins(:friendships).where("friendships.giver_id = ? AND friendships.receiver_id = ?", self, self)
    #self.friendships.pluck(:giver_id, :receiver_id).map { |arr| arr.select { |i| id != i } }
  end
end
