class Weather < ActiveRecord::Base
  belongs_to :trip


  def create_from_weather_service
    if !weather["weather"].nil?
      self.description  = weather["weather"].first["description"]
      self.temp         = weather["main"]["temp"]
      self.wind_speed   = weather["wind"]["speed"]
      self.degree     = weather["wind"]["deg"]
      save!
    end
  end

  private

  def weather
    @weather = WeatherService.new.weather_data(trip.lat, trip.long)
  end
end
