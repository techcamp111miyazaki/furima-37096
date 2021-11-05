class Item < ApplicationRecord
  belongs_to :user
  # has_many :orders
  has_one_attached :image

  with_options presence: true do
    :image
    :item_name 
    :explanation
    :price numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      :category_id
      :status_id
      :prefecture_id
      :shipment_fee_id
      :shipment_days_id
    end
  end

  # memo|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  # validates :item_name,         presence: true
  # validates :explanation,      presence: true
  # validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :status_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :price,            presence: true
  # validates :prefecture_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :shipment_fee_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :shipment_days_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  references :user,            presence: true, foreign_kye: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipment_fee
  belongs_to :shipment_days
end
