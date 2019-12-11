class BetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user
  end

  def show?
    record.friend == user
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

    def reject_to_home?
    record.friend == user
  end

  def new_premade?
    new?
  end
end
