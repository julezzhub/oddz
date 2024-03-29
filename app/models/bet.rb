class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :winner, class_name: 'User', optional: true
  has_many :notifications, as: :notifiable
  validates_presence_of :target, :metric, :metric_count, :start_time, :end_time, :stake

  validates :metric_count, numericality: { greater_than_or_equal_to: 0 }
  monetize :stake_cents

  # after_create :on_bet_create
  # around_update :around_bet_update

  # def completed?
  #   Time.now > self.end_time ? true : false
  # end

  # def winner
  #   User.find(self.winner_id)
  # end

  # def loser
  # if self.winner == self.friend
  #   self.user
  #   elsif self.winner
  #   self.friend
  # else
  #   nil
  #   end
  # end

  # final point in time to accept the bet
  def accept_deadline
    start_time + ((end_time - start_time) * 0.1)
  end

  # How many seconds are left to accept the bet
  def time_to_accept
    if Time.now > accept_deadline
      0
    else
      accept_deadline - Time.now
    end
  end

  def self.current_pending_bets(user)
    bets = Bet.where(friend: user, status: nil)
    bets.select { |bet| bet.time_to_accept.positive? }
  end

  def self.expired_pending_bets
    bets = Bet.where(status: nil)
    bets.select { |bet| bet.time_to_accept.zero? }
  end

  def expiration(time_in_seconds)
    t = time_in_seconds
    # if t < 3600
    # mm = t.divmod(60)
    # return "%dm %ds" % [mm, t]
    # "%02d:%02ds:" % [t / 3600, t / 60 % 60, t % 60]
    # elsif t > 86_400
    #   # mm = t.divmod(60)
    #   # hh, mm = mm.divmod(60)
    #   # dd, hh = hh.divmod(24)
    #   # return "%dd %dh %" % [dd, hh]
    #   "%02d:%02d:%02d" % [sec / 3600, sec / 60 % 60, sec % 60]
    # else
    # mm = t.divmod(60)
    # hh, mm = mm.divmod(60)
    # return "%d:%dh" % [hh, mm]
    # loop do
    #   sleep 60
    #   t -= 60
    #   break if t <= 0

      "%02d:%02dh" % [t / 3600, t / 60 % 60]
  end

  # def on_bet_create
  #   puts "bet created!"
  #   # Create notification: Bet invitation
  # end

  # def around_bet_update
  #   # if status has been changed now to 'true':
  #   #    bet accepted notification
  #   # if winner id has  changed:
  #   #   bet completed notification

  #   accepting = status_changed? && status == true
  #   completed = winner_id_changed? && !winner.nil?

  #   yield

  #   if accepting

  #   end

  #   if completed
  #     # create a new 'bet completed' notification
  #     puts ">>>>>>>>>>>>>>>> completed!"
  #   end

  # end
end
