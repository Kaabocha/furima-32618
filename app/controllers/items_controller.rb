class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.all 商品一覧表示の実装で使用
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :item_description, :category_id, :item_condition_id,
      :shipping_charge_id, :delivery_area_id, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
