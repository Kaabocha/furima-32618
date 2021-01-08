class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    binding.pry
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      @orderform.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def orderform_params
    params.require(:order).permit(:user_id, :item_id, :postal_code, 
      :delivery_area_id, :municipality, :address, :phone_number, :building, :order_id)
      .merge(user_id: current_user.id, item_id: params[:item_id]) #ここのcurrent_user.idが使えるのはdeviseのGemを導入しているからです。
  end
end

