class SoldsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :create]

  def index
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

  def set_item
    @item = Item.find(params[:id])
  end

end