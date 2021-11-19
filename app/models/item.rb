class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations

  # with_options presence: true do
  #   validates :images
  #   validates :item_name
  #   validates :explanation
  #   with_options numericality: { other_than: 1, message: "を入力してください" } do
  #     validates :category_id
  #     validates :status_id
  #     validates :prefecture_id
  #     validates :shipment_fee_id
  #     validates :shipment_days_id
  #   end
  #   validates :price,
  #             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
  #                             message: 'は300〜9,999,999で入力してください' }
  # end

  # memo|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  # validates :item_name,        presence: true
  # validates :explanation,      presence: true
  # validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :status_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :price,            presence: true
  # validates :prefecture_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :shipment_fee_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :shipment_days_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipment_fee
  belongs_to :shipment_days
end
