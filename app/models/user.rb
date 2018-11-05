class User < ApplicationRecord

	has_many :tickets
	has_many :invoices

end
