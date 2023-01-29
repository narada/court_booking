class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :play_hour
      t.date :play_date
      t.string :status
      t.integer :court_id
      t.integer :user_id
      t.text :note

      t.timestamps
    end
  end
end
