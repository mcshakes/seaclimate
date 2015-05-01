class NotificationController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    client = Twilio::REST::Client.new "ACc1e76f69576e56a5f485c749e5db4287", "52c9412a9e37c380c41e2d87b2624b2e"

    message = client.messages.create from: ENV["TWILIO_NUMBER"], to: ENV['TWILIO_VERIFIED_NUMBER'], body: 'Learning to send SMS you are.'

    render plain: message.status

  end
end
