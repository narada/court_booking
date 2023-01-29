class RemovePlayHourFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :play_hour
  end
end
