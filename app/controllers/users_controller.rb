class UsersController < ApplicationController

  def show
    if number_added?
      @trips = Trip.all
    else
      redirect_to edit_user_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def number_added?
    current_user.number
  end

  def user_params
    params.require(:user).permit(:number)
  end
end
