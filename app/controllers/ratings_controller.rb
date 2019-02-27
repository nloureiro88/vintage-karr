class RatingsController < ApplicationController
  def new
    authorize @rating
  end

  def create
    authorize @rating
  end
end
