require 'test_helper'

class ReceiveTextControllerTest < ActionController::TestCase

  test ".trips" do
    VCR.use_cassette("weather_service") do
      trips = WeatherService.new.weather_data(39.73, -104.99)
      assert trips["weather"].first.has_key?("description")
      # test the existence of the key instead of the value.
    end
  end
end
