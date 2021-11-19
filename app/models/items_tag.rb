class ItemsTag
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :images, :item_name, :explanation, :category_id, :status_id, :prefecture_id, :shipment_fee_id,
                :shipment_days_id, :price, :tag_name

  with_options presence: true do
    validates :user_id
    validates :images
    validates :item_name
    validates :explanation
    with_options numericality: { other_than: 1, message: 'を入力してください' } do
      validates :category_id
      validates :status_id
      validates :prefecture_id
      validates :shipment_fee_id
      validates :shipment_days_id
    end
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'は300〜9,999,999で入力してください' }
    validates :tag_name
  end

  def save
    item = Item.create(images: images, item_name: item_name, explanation: explanation, category_id: category_id,
                       status_id: status_id, prefecture_id: prefecture_id, shipment_fee_id: shipment_fee_id, shipment_days_id: shipment_days_id, price: price, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update
    @item = Item.where(id: item_id)
    item = @item.update(images: images, item_name: item_name, explanation: explanation, category_id: category_id,
                        status_id: status_id, prefecture_id: prefecture_id, shipment_fee_id: shipment_fee_id, shipment_days_id: shipment_days_id, price: price, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    map = ItemTagRelation.where(item_id: item_id)
    map.update(item_id: item_id, tag_id: tag.id)
  end

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category
  # belongs_to :status
  # belongs_to :prefecture
  # belongs_to :shipment_fee
  # belongs_to :shipment_days
end
