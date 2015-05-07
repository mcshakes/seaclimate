module ApplicationHelper

  def temperature_conversion(temp)
    temperature = temp * 9 / 5 - 459.67
    temperature.round(2)
  end
end
