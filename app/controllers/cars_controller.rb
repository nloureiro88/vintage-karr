class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_owner, only: %i[new create]
  before_action :set_car, only: %i[show edit update]

  def index
    @cars = Car.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.owner = @owner
    if @car.save
      redirect_to @car
    else
      :new
    end
  end

  def edit; end

  def update
    @car.owner = @owner
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

  def find_owner
    @owner = Owner.find(params[:owner_id])
  end

  def car_params
    params.require(:car).permit(:owner_id, :brand, :model,
                                :car_type, :fuel_type, :description,
                                :car_photo, :year, :mileage,
                                :for_rental, :price, :date_start, :date_end)
  end
end
