class Trip < ActiveRecord::Base
  has_one :weather
  belongs_to   :user
  after_create :add_weather

  def add_weather
    build_weather.create_from_weather_service
  end

end
