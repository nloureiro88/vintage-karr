class RatingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    record.driver == user # || user.admin? # Only driver from ratings' booking if booking status "finished"
  end
end
