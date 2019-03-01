class BookingsController < ApplicationController
  before_action :find_car, only: %i[create]

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
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.driver = current_user
    @booking.bk_price = @car.price
    authorize @booking
    if @booking.save
      redirect_to @car
    else
      flash[:alert] = @booking.errors.full_messages.join(', ')
      redirect_to @car
    end
  end

  def destroy # only if status "created"
    authorize @booking
  end

  private

  def find_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:car_id, :driver_id, :purpose,
                                    :status, :bk_start, :bk_end,
                                    :bk_price)
  end
end
