class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orderstreet = OrderStreet.new
  end

  def create
    @orderstreet = OrderStreet.new(order_params)
    @item = Item.find(params[:item_id])
    if @orderstreet.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]      # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,                       # 商品の値段
        card: order_params[:token],                         # カードトークン
        currency: 'jpy'                                     # 通貨の種類（日本円）
      )
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
      .merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id ]) #ここのcurrent_user.idが使えるのはdeviseのGemを導入しているからです。
  end
end

