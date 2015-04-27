class WeatherService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://api.openweathermap.org/data/2.5/")
  end

  def weather_data(lat, lon)
    parse(connection.get("weather?lat=#{lat}&lon=#{lon}&APPID=#{ENV["WEATHER_KEY"]}"))
  end

  private

  def parse(data)
    JSON.parse(data.body)
  end

end
