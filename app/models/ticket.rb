class Ticket < ApplicationRecord

	validates :event_id, presence: true

end
