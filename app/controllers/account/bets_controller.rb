class Account::BetsController < ApplicationController

	def policy_scope(scope)
		super([:account, scope])
  end

  def index
    @all_bets = policy_scope(Bet).where(friend: current_user).or(Bet.where(user: current_user))
    @current_bets = @all_bets.select { |bet| bet.end_time > Time.now && !bet.status.nil? }
    @past_bets = @all_bets.select { |bet| bet.end_time < Time.now && !bet.status.nil? }
  end

  def pending
    @bets = policy_scope(Bet).where(friend: current_user, status: nil)
  end
end
