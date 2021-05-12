class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :house_number
    validates :phone_number
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end

end