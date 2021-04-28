require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品登録が上手く行く時' do
      it '全ての情報が入力済みであれば商品登録できる' do
        binding.pry
      end
    end

    context '商品登録が上手く行かない時' do
      it 'nicknameが空だと登録できない' do
      end
    end
  end
end