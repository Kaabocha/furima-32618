class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create] #ログインしているユーザーにのみ許可しているアクション
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.order != nil 
      return redirect_to root_path
    end
    @orderstreet = OrderStreet.new
  end

  def create
    @orderstreet = OrderStreet.new(order_params)
    if @orderstreet.valid?
      payjp_info
      @orderstreet.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])       #各アクションの記述をbefore_actionでDRY化
  end

  def order_params
    params.require(:order_street).permit(:postal_code, :delivery_area_id, :municipality, :address, :phone_number, :building,)
      .merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id ]) #ここのcurrent_user.idが使えるのはdeviseのGemを導入しているからです。
  end

  def payjp_info
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]      # 自身のPAY.JPテスト秘密鍵を記述する
    Payjp::Charge.create(
      amount: @item.price,                       # 商品の値段
      card: order_params[:token],                # カードトークン
      currency: 'jpy'                            # 通貨の種類（日本円）
    )
  end

end

