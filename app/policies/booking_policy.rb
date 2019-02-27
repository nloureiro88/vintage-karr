class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.user == user || user.admin? # Only driver from ratings' booking and if status "created"
  end
end
