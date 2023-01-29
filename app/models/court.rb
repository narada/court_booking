class Court < ApplicationRecord

  validates_presence_of :name
  has_many :reservations
  has_many :court_availabilities

  scope :with_type, ->(type) { where("game_type = ?", type) }

  def reserved_play_hours(date = Time.now.to_date)
    reserved_slots = []
    reserved_slots = court_availabilities.where(date_slot: date).map(&:time_slots)
    reserved_slots.flatten
  end

  def court_info(date = Time.now.to_date)
    { name: name,
      postcode: postcode,
      format: format,
      type: game_type,
      surface: surface,
      reserved_hours: reserved_play_hours(date),
      available_hours: (1..24).to_a - reserved_play_hours(date),
      date: date
    }
  end

end
