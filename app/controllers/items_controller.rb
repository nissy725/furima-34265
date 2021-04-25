class ItemsController < ApplicationController
  def index
  end



  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
end