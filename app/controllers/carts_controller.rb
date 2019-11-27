class CartsController < ApplicationController

    def index
        if current_user.cart
            @cart_items = current_user.cart.cart_items
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

end
