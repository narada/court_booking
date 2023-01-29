class AddTypeToCourts < ActiveRecord::Migration[7.0]
  def change
    add_column :courts, :game_type, :string
  end
end
