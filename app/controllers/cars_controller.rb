class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update]

  def index
    @cars = policy_scope(Car).all
  end

  def show
    authorize @car
    @booking = Booking.new
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    @car.owner = current_user
    authorize @car
    if @car.save
      redirect_to @car
    else
      :new
    end
  end

  def edit
    authorize @car
  end

  def update
    authorize @car
    if @car.update(car_params)
      redirect_to @car
    else
      :edit
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model,
                                :car_type, :fuel_type, :description,
                                :car_photo, :year, :mileage,
                                :price, :date_start, :date_end)
  end
end
