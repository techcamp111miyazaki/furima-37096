class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = Item.new(item_params)
      render :new
    end
  end

  private###

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :price,:prefecture_id, :shipment_fee_id, :shipment_days_id).merge(user_id: current_user.id)
  end
end
