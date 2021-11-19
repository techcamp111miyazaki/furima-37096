require 'rails_helper'

RSpec.describe ItemsTag, type: :model do
  describe '商品の投稿' do
    before do
      user = FactoryBot.create(:user)
      sleep 0.1
      @items_tag = FactoryBot.build(:items_tag, user_id: user.id,
                                                images: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'), 'image/png'))
    end

    context '内容が問題ない場合' do
      it 'images..tag_nameまで全て存在すれば保存できる' do
        expect(@items_tag).to be_valid
      end
      it 'priceが半角表記かつ300以上9999999以下だと保存できる' do
        @items_tag.price = '1111'
        expect(@items_tag).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'imageが空だと保存できない' do
        @items_tag.images = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('商品画像を入力してください')
      end
      it 'item_nameが空だと保存できない' do
        @items_tag.item_name = ''
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('商品名を入力してください')
      end
      it 'explanationが空だと保存できない' do
        @items_tag.explanation = ''
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('説明を入力してください')
      end
      it 'category_idが1だと保存できない' do
        @items_tag.category_id = 1
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it 'status_idが1だと保存できない' do
        @items_tag.status_id = 1
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('商品の状態を入力してください')
      end
      it 'prefecture_idが1だと保存できない' do
        @items_tag.prefecture_id = 1
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it 'shipment_fee_idが1だと保存できない' do
        @items_tag.shipment_fee_id = 1
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it 'shipment_days_idが1だと保存できない' do
        @items_tag.shipment_days_id = 1
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it 'priceが空だと保存できない' do
        @items_tag.price = ''
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('価格を入力してください', '価格は300〜9,999,999で入力してください')
      end
      it 'priceが全角表記だと保存できない' do
        @items_tag.price = '２２２２'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('価格は300〜9,999,999で入力してください')
      end
      it 'priceが半角と全角の混合表記だと保存できない' do
        @items_tag.price = '２２22'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('価格は300〜9,999,999で入力してください')
      end
      it 'priceが300未満だと保存できない' do
        @items_tag.price = 299
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('価格は300〜9,999,999で入力してください')
      end
      it 'priceが10000000以上だと保存できない' do
        @items_tag.price = 10_000_000
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('価格は300〜9,999,999で入力してください')
      end
      it 'タグが空白では保存できない' do
        @items_tag.tag_name = ''
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('タグ名を入力してください')
      end
      it 'userに紐づいていないと保存できない' do
        @items_tag.user_id = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
