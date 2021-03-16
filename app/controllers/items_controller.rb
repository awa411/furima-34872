class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      @item = item
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_charge_id, :state_id,
                                 :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
