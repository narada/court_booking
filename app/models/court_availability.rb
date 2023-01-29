class CourtAvailability < ApplicationRecord
  belongs_to :court
  belongs_to :reservation

  serialize :time_slots, Array
end
