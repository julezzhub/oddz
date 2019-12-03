class BetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user
  end

  def create?
    new?
  end

  def pending?
    true
  end

  def accept?
    record.bet.user == user
  end

  def reject?
    record.bet.user == user
  end
end
