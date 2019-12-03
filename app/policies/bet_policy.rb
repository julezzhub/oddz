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
    record.friend == user
  end

  def reject?
    record.friend == user
  end
end
