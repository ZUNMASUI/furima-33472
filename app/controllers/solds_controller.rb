class SoldsController < ApplicationController

  def index
    @item = Item.find(params[:item_id]) 
    @sold_address = SoldAddress.new
  end
  

  def new
  end

  def create
    @sold_address = SoldAddress.new(sold_params)
    if @sold_address.valid?
       @sold_address.save
       redirect_to root_path
    else
      render 'index'
    end

  end

  private
  
  def sold_params
    item = Item.find(params[:item_id]) 
    params.require(:sold_address).permit(:postcode,:shipping_prefecture_id,:address,:house_number,
      :building_number,:phone_number).merge(user_id: current_user.id,item_id:item.id)
  end
end