class CreateCourts < ActiveRecord::Migration[7.0]
  def change
    create_table :courts do |t|
      t.string :name
      t.string :postcode
      t.string :format
      t.string :surface
      t.string :state


      t.timestamps
    end
  end
end
