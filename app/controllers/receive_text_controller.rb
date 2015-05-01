class ReceiveTextController < ApplicationController

  def index
    name = params["Body"]
    from_number = params["From"]

    SMSLogger.log_text_message ENV["TWILIO_NUMBER"], ENV['TWILIO_VERIFIED_NUMBER']

  end

  def create
    @user = User.find_by(number: params["From"])
    @trip = @user.trips.new
    @trip.name = params["Body"]
    @trip.save
  end
end
