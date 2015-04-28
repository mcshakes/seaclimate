class Weather < ActiveRecord::Base
  belongs_to :trip


  def create_from_weather_service
    if !weather["weather"].nil?
      self.description  = weather["weather"].first["description"]
      self.temp         = weather["main"]["temp"]
      self.wind_speed   = weather["wind"]["speed"]
      save!
    end
  end

  def weather_summary
    "The weather is #{description}, with a temperature of #{temp} and
    wind speeds of #{wind_speed}"
  end

  private

  def weather
    @weather ||= WeatherService.new.weather_data(trip.lat, trip.long)
  end
end
