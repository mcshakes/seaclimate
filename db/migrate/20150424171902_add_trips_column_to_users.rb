class AddTripsColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trip, :text

  end
end
