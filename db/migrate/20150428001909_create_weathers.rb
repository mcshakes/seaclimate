class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :trip_id
      t.text    :description
      t.float   :temp
      t.float   :pressure
      t.integer :humidty
      t.float   :wind_speed
      t.float   :degree
      t.timestamps null: false
    end
  end
end
