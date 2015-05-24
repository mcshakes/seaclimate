require 'test_helper'

class SmsTest < ActiveSupport::TestCase
  attr_reader :trip

  # def setup
  #   @weather = WeatherService.new.weather_data(39.73, -104.99)
  #   @trip = Trip.create({weather: @weather, lat: 39.73, long: -104.99})
  # end

  ## The Error Message ##
  # ActiveRecord::AssociationTypeMismatch:
  # Weather(#70143568269060) expected, got Hash(#70143544069300)
  # test/models/sms_test.rb:8:in `setup'

  def test_it_renders_proper_message_to_user
    skip
    message = SMS.message_body(trip)
  end

end
