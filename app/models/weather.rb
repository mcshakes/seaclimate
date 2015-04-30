class Weather < ActiveRecord::Base
  belongs_to :trip


  def create_from_weather_service
    if !weather["weather"].nil?
      self.description  = weather["weather"].first["description"]
      self.temp         = weather["main"]["temp"]
      self.wind_speed   = weather["wind"]["speed"]
      self.degree     = weather["wind"]["deg"]
      self.max_temp   = weather["main"]["temp_max"]
      self.cloud      = weather["clouds"]["all"]
      save!
    end
  end

  # def weather_summary
  #  "Conditions: #{description},
  #   Temperature: #{temp} Kelvin,
  #   Max Temp:    #{temp_max},
  #   Wind Speeds: #{wind_speed} mps,
  #   Wind Direction: #{wind_deg},
  #   Cloud Cover: #{clouds} %"
  # end

  private

  def weather
    @weather = WeatherService.new.weather_data(trip.lat, trip.long)
  end
end
