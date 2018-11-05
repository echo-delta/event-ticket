class Section < ApplicationRecord

	belongs_to :venue
	validates :venue, presence: true

end
