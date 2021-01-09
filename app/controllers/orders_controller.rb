class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orderstreet = OrderStreet.new
  end

  def create
    @orderstreet = OrderStreet.new(order_params)
    # binding.pry
    if @orderstreet.valid?
      @orderstreet.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_street).permit(:postal_code, :delivery_area_id, :municipality, :address, :phone_number, :building,)
      .merge(user_id: current_user.id, item_id: params[:item_id ]) #ここのcurrent_user.idが使えるのはdeviseのGemを導入しているからです。
  end
end

