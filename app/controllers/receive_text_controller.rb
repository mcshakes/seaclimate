class ReceiveTextController < ApplicationController

  def index
    name = params["Body"]
    from_number = params["From"]

    SMSLogger.log_text_message ENV["TWILIO_NUMBER"], ENV['TWILIO_VERIFIED_NUMBER']

  end

  def create
    name = params["Body"]
    from_number = params["From"]
    render xml
  end
end
