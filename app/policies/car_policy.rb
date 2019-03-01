class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def garage?
    true
  end

  def hide?
    record.owner == user # || user.admin?
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.owner == user # || user.admin?
  end
end
