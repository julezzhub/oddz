class Account::BetPolicy < ApplicationPolicy
  class Scope < Scope
	def resolve
		scope.all
	  end
	end

  def pending?
  	user # so only user can view pending
  end
end
