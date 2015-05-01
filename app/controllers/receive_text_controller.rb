class ReceiveTextController < ApplicationController
  skip_before_filter :force_ssl

  def index
    name = params["Body"]
    from_number = params["From"]

    SMSLogger.log_text_message ENV["TWILIO_NUMBER"], ENV['TWILIO_VERIFIED_NUMBER']

  end

  def create
    # User.create
    # binding.pry
    @user = User.find_by(number: params["From"])
    @trip = @user.trips.new
    @trip.name = params["Body"]
    @trip.save
    render :text => "HEEEY"
  end
end
