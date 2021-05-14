class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only:[:index, :create]

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_history_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_103683e06acb24157d075930"
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_history_params[:token],
        currency: 'jpy'
      )  
  end
  
  def move_to_root_path
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end