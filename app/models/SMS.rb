class SMS

  def self.client
    Twilio::REST::Client.new "ACc1e76f69576e56a5f485c749e5db4287", "52c9412a9e37c380c41e2d87b2624b2e"
  end

  def self.send_text(trip)
    client.messages.create(from: ENV["TWILIO_NUMBER"],
                           to: ENV['TWILIO_VERIFIED_NUMBER'],
                           body: message_body(trip)
                          )
  end

  def self.message_body(trip)
    "Conditions: #{trip.weather.description}\n" +
    "Temperature: #{temp_converter(trip.weather.temp)} Fahrenheit\n" +
    "Wind Speed: #{trip.weather.wind_speed}\n" +
    "Wind Direction: #{trip.weather.degree}\n"
  end

  def self.temp_converter(temp)
    temperature = temp * 9 / 5 - 459.67
    temperature.round(2)
  end


end
