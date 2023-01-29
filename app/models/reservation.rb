class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :court

  has_one :court_availability
end
