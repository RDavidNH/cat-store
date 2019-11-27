class CartsController < ApplicationController

    def index
        @cart_items = current_user.cart.cart_items
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

        puts '*' * 12
        puts current_user.email
        p current_cart.cart_items
        puts '*' * 12
                
    end

    def update
        
    end

    def destroy 

    end

end
