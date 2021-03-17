class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :is_not_current_user, only: [:index, :create]
  before_action :bought_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :state_id, :city, :town, :building, :phone_number, :item_id)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: Item.find(params[:item_id]).price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def is_not_current_user
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end

  def bought_item
    if Order.where(item_id: params[:item_id]).exists?
      redirect_to root_path
    end
  end

end
