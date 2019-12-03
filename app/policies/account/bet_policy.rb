class Account::BetPolicy < ApplicationPolicy
  class Scope < Scope
	  def resolve
	    scope.all
	  end
	end
	
  def pending?
  	true
  end
end
