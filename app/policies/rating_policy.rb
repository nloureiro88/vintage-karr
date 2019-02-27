class RatingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    record.user == user || user.admin? # Only driver from ratings' booking
  end
end
