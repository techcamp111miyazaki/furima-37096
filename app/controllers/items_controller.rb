class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
     redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private ###

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :price, :prefecture_id,
                                 :shipment_fee_id, :shipment_days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == item.user_id
      redirect_to action: :index
    end
  end
end
