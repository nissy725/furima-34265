class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  has_one :purchase_history

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
  end

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
    greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999
    } 
 

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
end
