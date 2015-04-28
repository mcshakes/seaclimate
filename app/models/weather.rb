class Weather < ActiveRecord::Base
  belongs_to :trip

  def create_from_weather_service
    self.description = weather["weather"].first["description"]
    save!
  end

  def weather_summary
    "The weather is #{description}"
  end

  private

  def weather
    @weather ||= WeatherService.new.weather_data(trip.lat, trip.long)
  end
end
