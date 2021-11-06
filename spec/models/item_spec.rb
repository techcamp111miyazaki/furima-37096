require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品新規保存" do
    context "新規保存できる場合" do
      it "image..priceまで全て存在すれば保存できる" do
        expect(@item).to be_valid
      end
      it "priceが半角表記だと保存できる" do
        @item.price = "1111"
        expect(@item).to be_valid
      end
    end
    context "新規保存できない場合" do
      it "imageが空だと保存できない" do
        @item.image = nil
        @item.valid?
      end
      it "item_nameが空だと保存できない" do
        
      end
      it "explanationが空だと保存できない" do
        
      end
      it "category_idが1だと保存できない" do
        
      end
      it "status_idが1だと保存できない" do
        
      end
      it "priceが空だと保存できない" do
        
      end
      it "priceが全角表記だと保存できない" do
        
      end
      it "priceが半角と全角の混合表記だと保存できない" do
        
      end
      it "priceが300以下だと保存できない" do
        
      end
      it "priceが10000000以上だと保存できない" do
        
      end
      it "prefecture_idが1だと保存できない" do
        
      end
      it "shipment_fee_idが1だと保存できない" do
        
      end
      it "shipment_days_idが1だと保存できない" do
        
      end
    end
  end
end
