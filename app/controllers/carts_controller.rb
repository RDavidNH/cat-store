class CartsController < ApplicationController

    def index
        if current_user.cart
            @cart_items = current_user.cart.cart_items
            quantity_total
            price_total
        end
    end

    def create

        item = Item.find(params[:id])

        if current_user.cart
            current_cart = current_user.cart
        else 
            current_cart = Cart.create()
            current_user.cart = current_cart
            current_user.save
        end


        order = CartItem.find_by(item: item, cart: current_cart)

        if order
        	order.quantity += 1
        	order.save
        else
        	cart_items = CartItem.create(cart: current_cart, item: item, quantity: 1)
        end

                
    end

    def update
        
    end

    def destroy 

    end

    def quantity_total
        cart_items_to_sum = current_user.cart.cart_items
        @quantity_total = 0
        cart_items_to_sum.each do |item|
            @quantity_total = @quantity_total + item.quantity
        end
        return @quantity_total
    end

    def price_total 
        cart_items_to_sum = current_user.cart.cart_items
        @price_total = 0

        cart_items_to_sum.each do |product|
            each_line_price = product.quantity * product.item.price 
            @price_total =  @price_total + each_line_price
        end
        return @price_total
    end

end
