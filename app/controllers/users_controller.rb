class UsersController < ApplicationController
  def show
    @trips = Trip.all
  end
end
