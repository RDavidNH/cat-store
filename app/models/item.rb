class Item < ApplicationRecord
	validates :title, presence: true,
		length: { in: 6..150 }

	validates :description, presence: true,
		length: { in: 6..1000 }

	validates :price, presence: true,
		:if => :price_validation



	def price_validation
		if self.price.blank?
			errors.add(:message, "Price can't be blank")
		elsif self.price < 1 || self.price > 1000
			errors.add(:message, "Price must be between 1 and 1000")
		end
	end
end
