require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      sleep 0.1
      @item = FactoryBot.create(:item)
      sleep 0.1
      @order_shipment = FactoryBot.build(:order_shipment, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'postal_code...tokenまで全て値が存在する' do
        expect(@order_shipment).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_shipment.building_name = ''
        expect(@order_shipment).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できない' do
        @order_shipment.postal_code = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは数字のみでは保存できない' do
        @order_shipment.postal_code = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it "prefecture_idが１では保存できない" do
        @order_shipment.prefecture_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @order_shipment.house_number = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @order_shipment.telephone_number = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが11桁以上では保存できない' do
        @order_shipment.telephone_number = '09012345678900'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Telephone number is invalid. Input half-width numbers between from 10 to 11 characters')
      end
      it 'telephone_numberが9桁以下では保存できない' do
        @order_shipment.telephone_number = '0901234'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Telephone number is invalid. Input half-width numbers between from 10 to 11 characters')
      end
      it 'telephone_numberに半角数字以外が混入すると保存できない' do
        @order_shipment.telephone_number = '090a1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Telephone number is invalid. Input half-width numbers between from 10 to 11 characters')
      end
      it 'tokenが空では保存できない' do
        @order_shipment.token = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
      end
      it 'userと紐づいていないと保存できない' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていないと保存できない' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
