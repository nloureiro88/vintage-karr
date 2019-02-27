class BookingsController < ApplicationController
  def new
    authorize @booking
  end

  def create
    authorize @booking
  end

  def destroy # only if status "created"
    authorize @booking
  end
end
