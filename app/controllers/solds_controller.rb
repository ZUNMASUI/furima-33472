class SoldsController < ApplicationController

  def index
    @item = Item.find(params[:item_id]) #itemのレコードを探して代入をする、paramsのitem_idを活用しましょう
    # @sold = @item.index #ストロングパラメータが必要かどうかを確認しましょう
  end
  

  def new
    @sold_address = SoldAddress.new
  end

  def create
    @sold_address = SoldAddress.new()
  end

  private
  # def item_params
  #   params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :shipping_fee_id, :shipping_prefecture_id,
  #     :shipping_days_id, :price)
  # end
  # def sold_params
  #   params.require(:sold).permit(:image, :title, :explanation, :category_id, :condition_id, :shipping_fee_id, :shipping_prefecture_id,
  #     :shipping_days_id, :price,)
  # end
end