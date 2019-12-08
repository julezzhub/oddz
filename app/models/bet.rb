class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :winner, class_name: 'User', optional: true

  validates_presence_of :target, :metric, :metric_count, :start_time, :end_time, :stake

  validates :metric_count, numericality: { greater_than_or_equal_to: 0 }

  monetize :stake_cents
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
    "%02d:%02dh" % [t / 3600, t / 60 % 60]
    # end
  end
end
