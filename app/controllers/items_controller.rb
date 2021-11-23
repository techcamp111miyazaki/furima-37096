class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :searching, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :search_item
  before_action :set_item_column

  def index
    @items = Item.order('created_at DESC')
  end

  def searching
    @results = @p.result.reverse
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
      flash.now[:alert] = '商品出品に失敗しました'
    end
  end

  def show
  end

  def edit
    @items_tag = ItemsTag.new(item_name: @item.item_name, explanation: @item.explanation, category_id: @item.category_id, status_id: @item.status_id, price: @item.price, prefecture_id: @item.prefecture_id,
                              shipment_fee_id: @item.shipment_fee_id, shipment_days_id: @item.shipment_days_id)
  end

  def update
    @items_tag = ItemsTag.new(update_params)
    if @items_tag.valid?
      @items_tag.update
      redirect_to root_path
    else
      render :edit
      flash.now[:alert] = '商品編集に失敗しました'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['tag_name Like ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  def search_id
    return nil if params[:keyword] == ''

    tag = Tag.where(['tag_name Like ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private ###

  def item_params
    params.require(:items_tag).permit(:item_name, :explanation, :category_id, :status_id, :price, :prefecture_id,
                                      :shipment_fee_id, :shipment_days_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:items_tag).permit(:item_name, :explanation, :category_id, :status_id, :price, :prefecture_id,
                                      :shipment_fee_id, :shipment_days_id, :tag_name, images: []).merge(user_id: current_user.id, item_id: params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index if user_signed_in? && current_user.id != item.user_id || item.order.present?
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    @item_category_id = Item.select('category_id').distinct
  end
end
