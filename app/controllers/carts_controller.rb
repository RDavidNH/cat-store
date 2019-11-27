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

        cart_items = CartItem.create(cart: current_cart, item: item, quantity: 1)
                
    end

    def update
        
    end

    def destroy 

    end

end
