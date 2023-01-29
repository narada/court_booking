class CreateCourtAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :court_availabilities do |t|
      t.integer :court_id
      t.date :date_slot
      t.string :time_slots
      t.string :state

      t.timestamps
    end
  end
end
