class SettingsPolicy < ApplicationPolicy
  class Scope < Scope
   def resolve
    scope.all
    end
  end

  def wallet?
    user
  end
end
