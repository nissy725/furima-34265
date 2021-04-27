class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :product_name, :product_description, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, numericality: { other_than: 1 }
end
