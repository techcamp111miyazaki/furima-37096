class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
