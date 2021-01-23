class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:edit,:new,:create,:update]
  before_action :move_to_index, except: [:index, :show,:new,:create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :shipping_fee_id, :shipping_prefecture_id,
                                 :shipping_days_id, :price).merge(user_id: current_user.id)
  end
  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
    end
 end
end
