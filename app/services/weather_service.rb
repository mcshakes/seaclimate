class WeatherService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://api.openweathermap.org/data/2.5/")
  end

  def weather_data(lat, lon)
    parse(connection.get("weather?lat=#{lat}&lon=#{lon}&APPID=#{ENV["WEATHER_KEY"]}"))
  end

  # WeatherService.new.weather_data(39.73,-104.9903) gets me Denver
  # Denver is (39.73,-104.9903)a

  private

  def parse(data)
    JSON.parse(data.body)
  end

end
