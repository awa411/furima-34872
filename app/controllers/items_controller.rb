class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :search_item, only: [:index, :items_search, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :is_current_user, only: [:edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def items_search
    @results = @p.result
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_tag_params)
   
    if @item.valid? 
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end
  
  def edit
    if Order.where(item_id: @item.id).exists?
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def search_item
    @p = Item.ransack(params[:q])
  end

  def is_current_user
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def item_tag_params
    if params.include?(:item)
      params.require(:items_tag).permit(:item_name, :description, :category_id, :status_id, :shipping_charge_id, :state_id,
                                 :day_to_ship_id, :price, :name).merge(user_id: current_user.id, images: params[:item][:images])
    else
      params.require(:items_tag).permit(:item_name, :description, :category_id, :status_id, :shipping_charge_id, :state_id,
        :day_to_ship_id, :price, :name).merge(user_id: current_user.id)
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_charge_id, :state_id,
      :day_to_ship_id, :price, images: []).merge(user_id: current_user.id)
    end
end
