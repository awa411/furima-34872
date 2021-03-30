class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :bought_item, only: [:index, :create]
  before_action :order_record, only: :index
  before_action :user_address, only: :index

  def index
    
    @order_address = OrderAddress.new(@user_address)
  end
  
  def create
    redirect_to new_card_path and return unless current_user.card.present?
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      order_record
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
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: order_params[:price],
      customer: customer_token,
      currency: 'jpy'
    )
  end
  
  def order_record
    @item = Item.find(params[:item_id])
  end
  
  def user_address
    user_address = UserAddress.find_by(user_id: current_user.id)
    @user_address = user_address.attributes
    @user_address.delete("id")
    @user_address.delete("created_at")
    @user_address.delete("updated_at")
  end

  
  def bought_item
    if Order.where(item_id: params[:item_id]).exists? || current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end
end
