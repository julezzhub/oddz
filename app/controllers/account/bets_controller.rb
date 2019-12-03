class Account::BetsController < ApplicationController

	def policy_scope(scope)
   super([:account, scope])
 	end

  def pending
    @bets = policy_scope(Bet).where(friend: current_user, status: nil)
  end
end
