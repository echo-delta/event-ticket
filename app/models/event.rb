class Event < ApplicationRecord

	has_many :tickets, dependent: :destroy
	has_many :invoices, dependent: :destroy

end
