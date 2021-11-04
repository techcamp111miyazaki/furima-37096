class Item < ApplicationRecord
  belongs_to :user
  # has_many :orders
  has_one_attached :image

  validates :explanation,      presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :price,            presence: true
  validates :prefecture_id,    presence: true
  validates :shipment_fee_id,  presence: true
  validates :shipment_days_id, presence: true

  references :user,            presence: true, foreign_kye: true
end
