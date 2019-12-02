class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  # belongs_to :winner, class_name: 'User'

  validates_presence_of :target, :metric, :metric_count, :start_time, :end_time, :stake

  validates :metric_count, numericality: { greater_than_or_equal_to: 0 }

  monetize :stake_cents
  def completed?
  	Time.now > self.end_time ? true : false 
  end

  def winner
    User.find(self.winner_id)
  end 

  def loser
  	if self.winner == self.friend
  		self.user
  	elsif self.winner 
  		self.friend
  	else
  		nil
  	end
  end 
end
