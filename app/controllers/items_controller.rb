class ItemsController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:title,:explanation,:category_id,:condition_id,:shipping_fee_id,:shipping_prefecture_id,:shipping_days_id,:price).merge(user_id: current_user.id)
end
