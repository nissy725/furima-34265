class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
    
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if @purchase_history_address.valid?
      @purchase_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_history_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end