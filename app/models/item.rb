class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
  end

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
  
end
