class OrdersController < ApplicationController
  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(order_params)
    if @user_buy.valid?
      @user_buy.save
      redirect_to root_path
    else 
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :municipality, :addres, :building_name, :tell, :order_user_id)
  end
end