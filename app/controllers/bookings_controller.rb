class BookingsController < ApplicationController


  def index
     @bookings = policy_scope(Booking).all
  end

  def b_index_user
    @bookings = policy_scope(Booking).where(driver: current_user)
  end

  def b_index_owner
    @cars = Car.where(owner: current_user)
    @bookings = policy_scope(Booking).where(car: @cars)
  end

  def b_index_car
    # Ruby directly on cars/show.html.erb
    # Missing the connection to @car
    @bookings = policy_scope(Booking).where(car_id: @car)
    #@bookings = policy_scope(Booking).where(car_id: 12)
  end


  def create
    authorize @booking
  end

  def destroy # only if status "created"
    authorize @booking
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
