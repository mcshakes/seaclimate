class TripsController < ApplicationController

  def index

  end

  def create
    @trip = Trip.new(params[:])
  end


end
