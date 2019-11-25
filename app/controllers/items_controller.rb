class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def create
  
  end

  def update
  
  end

  def delete
  
  end

  def new

  end

  def show
    @current_item = Item.find(params[:id])
  end

end
