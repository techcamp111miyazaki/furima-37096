require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規保存' do
    context '新規保存できる場合' do
      it 'image..priceまで全て存在すれば保存できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角表記かつ300以上9999999以下だと保存できる' do
        @item.price = '1111'
        expect(@item).to be_valid
      end
    end
    context '新規保存できない場合' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空だと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが1だと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'prefecture_idが1だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipment_fee_idが1だと保存できない' do
        @item.shipment_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment fee can't be blank")
      end
      it 'shipment_days_idが1だと保存できない' do
        @item.shipment_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment days can't be blank")
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角表記だと保存できない' do
        @item.price = '２２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers between from 300 to 9999999.')
      end
      it 'priceが半角と全角の混合表記だと保存できない' do
        @item.price = '２２22'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers between from 300 to 9999999.')
      end
      it 'priceが300未満だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers between from 300 to 9999999.')
      end
      it 'priceが10000000以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers between from 300 to 9999999.')
      end
      it 'userに紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
