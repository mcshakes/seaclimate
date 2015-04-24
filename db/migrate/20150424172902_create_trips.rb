class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :long
      t.string :lat
      t.text   :weather
    end
  end
end
