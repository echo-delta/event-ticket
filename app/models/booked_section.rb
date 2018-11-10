class BookedSection < ApplicationRecord
	
	belongs_to :invoice
	validates :invoice_id, presence: true

end
