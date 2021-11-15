class OrderShipment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン有りの半角数字で入力してください' }
    validates :city
    validates :house_number
    validates :telephone_number,
              format: { with: /\A\d{10,11}\z/, message: 'はハイフン無しの半角数字で入力してください' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                    building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
