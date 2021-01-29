class SoldsController < ApplicationController
before_action :authenticate_user!, only: [:index, :new, :create]
before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @sold_address = SoldAddress.new
  end
  
  def create 
    @item = Item.find(params[:item_id])
    @sold_address = SoldAddress.new(sold_params)
    if @sold_address.valid?
       pay_item
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
      :building_number,:phone_number).merge(user_id: current_user.id,item_id:item.id,token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
     amount: @item[:price],  # 商品の値段
     card: sold_params[:token],    # カードトークン
     currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.sold.present? 
    redirect_to root_path
    end
  end
end