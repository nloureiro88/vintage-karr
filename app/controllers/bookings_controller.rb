class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).all

    # @bookings = policy_scope(Booking).where(booking.driver == current.user)
  end

  def create
    authorize @booking
  end

  def destroy # only if status "created"
    authorize @booking
  end
end
