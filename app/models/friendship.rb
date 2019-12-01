class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friended, class_name: 'User'
  validates_uniqueness_of :user_id, scope: :friended_id
end
