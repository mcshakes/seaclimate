class NotificationController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify

  end
end
