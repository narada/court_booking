class AddReservationIdToCourtAvailabilities < ActiveRecord::Migration[7.0]
  def change
    add_column :court_availabilities, :reservation_id, :integer
  end
end
