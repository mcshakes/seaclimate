class TripsController < ApplicationController

  def index

  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Trip Created!"
      redirect_to trip_path
    else
      flash[:notice] = "Shit happened..."
      redirect_to trip_path
    end
  end



  private

  def trip_params
    params.require(:trip).permit(:name, :long, :lat)
  end

end
