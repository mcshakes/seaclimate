require 'test_helper'

class SmsTest < ActiveSupport::TestCase
  attr_reader :trip

  def setup
    @weather = WeatherService.new.weather_data(39.73, -104.99)
    @trip = Trip.create({weather: @weather, lat: 39.73, long: -104.99})
    binding.pry
  end

  def test_it_renders_proper_message_to_user
    message = SMS.message_body(trip)

  end

end
