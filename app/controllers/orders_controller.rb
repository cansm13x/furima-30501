class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new(order_params)
    if @user_buy.valid?
      Payjp.api_key = "sk_test_82b63b2bef8f4396fc6d6b43"
      Payjp::Charge.create( 
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @user_buy.save
      redirect_to root_path
    else 
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :municipality, :addres, :building_name, :tell, :order_user_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end