require 'rails_helper'
RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
    sleep 0.015
  end
  describe '商品購入' do
    context '内容に問題がないとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_history_address).to be_valid
      end

      it 'ビル名が空でも購入できる' do
        @purchase_history_address.building_name = ""
        expect(@purchase_history_address).to be_valid
      end

    end

    context '購入できないとき' do
      it 'tokenが空では保存できない' do
        @purchase_history_address.token = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end
      
      it '郵便番号が空では保存できない' do
        @purchase_history_address.postal_code = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号はハイフンが無ければ保存できない' do
        @purchase_history_address.postal_code = "1234567"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号は適切な桁数（数字３桁 - 数字４桁)でなければ保存できない' do
        @purchase_history_address.postal_code = "123-456"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号は全角文字では保存できない' do
        @purchase_history_address.postal_code = " １２３-４５６７"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号は半角英数字混合では保存できない' do
        @purchase_history_address.postal_code = " a23-4567"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが0では保存できない' do
        @purchase_history_address.prefecture_id = 0
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'municipalityが空では保存できない' do
        @purchase_history_address.municipality = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberが空では保存できない' do
        @purchase_history_address.house_number = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @purchase_history_address.phone_number = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字では保存できない' do
        @purchase_history_address.phone_number = "０９０１１１１１１１１"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角英数字では保存できない' do
        @purchase_history_address.phone_number = "a9011111111"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上の数字では保存できない' do
        @purchase_history_address.phone_number = "090123456789"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Phone number is invalid")
      end
    end

  end
end