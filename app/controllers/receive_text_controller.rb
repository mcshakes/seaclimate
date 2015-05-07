class ReceiveTextController < ApplicationController
  skip_before_filter :force_ssl

  def index
    name = params["Body"]
    ENV["TWILIO_VERIFIED_NUMBER"] = params["From"]

    SMSLogger.log_text_message ENV["TWILIO_NUMBER"], ENV['TWILIO_VERIFIED_NUMBER']
  end

  def create
    user = User.find_by(number: params["From"])
    lat = params["Body"].split.first.gsub(",","")
    long = params["Body"].split.last
    trip = Trip.create(lat: lat, long: long)
    SMS.send_text(trip)
    user.trips << trip
  end
end
