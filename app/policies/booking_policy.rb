class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def garage_bookings?
    true
  end

  def create?
    true
  end

  def destroy?
    record.driver == user # || user.admin?
  end
end
