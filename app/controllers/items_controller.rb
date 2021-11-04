class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private###

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
