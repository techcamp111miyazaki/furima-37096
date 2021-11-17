class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
      flash.now[:alert] = "商品出品に失敗しました"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
      flash.now[:alert] = "商品出品に失敗しました"
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private ###

  def item_params
    params.require(:items_tag).permit(:item_name, :explanation, :category_id, :status_id, :price, :prefecture_id,
                                 :shipment_fee_id, :shipment_days_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index if user_signed_in? && current_user.id != item.user_id || item.order.present?
  end
end
