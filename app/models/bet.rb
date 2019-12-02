class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :winner, class_name: 'User'

  validates_presence_of :target, :metric, :metric_count, :start_time, :end_time, :friend_id

  validates :metric_count, numericality: { greater_than_or_equal_to: 0 }
end
