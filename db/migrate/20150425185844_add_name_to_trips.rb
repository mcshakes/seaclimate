class AddNameToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :name, :text
  end
end
