class CartItem < ApplicationRecord
	belongs_to :cart, dependent: :destroy
	belongs_to :item, dependent: :destroy
end
