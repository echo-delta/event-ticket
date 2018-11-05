class Venue < ApplicationRecord

	has_many :sections, dependent: :destroy

end
