class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      pay_iten
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_iten
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    item = Item.find(params[:item_id])
    redirect_to root_path if item.order.present? || item.user_id == current_user.id
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
