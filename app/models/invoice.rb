class Invoice < ApplicationRecord
	after_initialize :set_defaults

	belongs_to :user
	has_many :tickets
	has_many :booked_sections
	validates :user_id, presence: true
	validates :event_id, presence: true

  def set_defaults
    self.is_paid  ||= 0
  end

end
