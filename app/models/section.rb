class Section < ApplicationRecord
	after_initialize :set_defaults

	belongs_to :venue
	validates :venue_id, presence: true
	validates :price, presence: true

	def set_defaults
    self.price  ||= 0
  end

end
