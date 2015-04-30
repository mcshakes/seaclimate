class RemoveColumnsandAddToWeather < ActiveRecord::Migration
  def change
    remove_column :weathers, :humidty, :integer
    add_column :weathers, :cloud, :float
    add_column :weathers, :max_temp, :float
  end
end
