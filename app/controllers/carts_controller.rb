class CartsController < ApplicationController

    before_action :authenticate_user

    def index
        current_cart = Cart.find_by(:user => current_user, :status => "on")

        if current_cart
            @cart_items = current_cart.orders
            quantity_total(@cart_items)
            price_total(@cart_items)
        end
    end

    def create

        item = Item.find(params[:id])

        current_cart = Cart.find_by(:user => current_user, :status => "on")

        if not current_cart
            current_cart = Cart.create(:user => current_user, :status => "on")
        end

        order = Order.create(:cart => current_cart, :item => item, :quantity => params[:quantity])

        # if current_user.cart
        #     current_cart = current_user.cart
        # else
        #     current_cart = Cart.create()
        #     current_user.cart = current_cart
        #     current_user.save
        # end


        # order = CartItem.find_by(item: item, cart: current_cart)

        # if order
        # 	order.quantity += 1
        # 	order.save
        # else
        # 	cart_items = CartItem.create(cart: current_cart, item: item, quantity: 1)
        # end


    end

    def update

    end

    def destroy

    end

    def quantity_total(orders)
        cart_items_to_sum = orders
        @quantity_total = 0
        cart_items_to_sum.each do |item|
            @quantity_total = @quantity_total + item.quantity
        end
        return @quantity_total
    end

    def price_total(orders)
        cart_items_to_sum = orders
        @price_total = 0

        cart_items_to_sum.each do |product|
            each_line_price = product.quantity * product.item.price
            @price_total =  @price_total + each_line_price
        end
        return @price_total
    end

end
