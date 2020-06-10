class BarPolicy < ApplicationPolicy


  def show?
    return true
  end

  def create?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
