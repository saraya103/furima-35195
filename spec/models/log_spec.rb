require 'rails_helper'

RSpec.describe Log, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'buildingの値が空でも保存できること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_numberが空だと保存できないこと' do
        @order.postal_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal number can't be blank")
      end
      it 'prefectureが空だと保存できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture id can't be blank")
      end
      it 'prefectureが0だと保存できないこと' do
        @order.prefecture = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'telが数値だと保存できないこと' do
        @order.tel = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is valid. Input onpy number')
      end
      it 'userが紐づいていないと保存できないこと' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
