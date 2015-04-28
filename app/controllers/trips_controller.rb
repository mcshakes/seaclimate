class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Trip Created!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Something happened..."
      redirect_to user_path(current_user)
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :long, :lat)
  end

end
