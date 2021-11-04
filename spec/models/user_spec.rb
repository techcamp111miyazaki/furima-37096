require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "nickname...birthdayまで全て存在すれば登録できる" do
        
      end
      it "passwordが6文字以上で登録できる" do
        
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空だと登録できない" do
        
      end
      it "emailが空だと登録できない" do
        
      end
      it "重複したemailだと保存ができない" do
        
      end
      it "passwordが空だと登録できない" do
        
      end
      it "passwordが5文字以下だと登録できない" do
        
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        
      end
      it "last_nameが空だと登録できない" do
        
      end
      it "first_nameが空だと登録できない" do
      
      end
      it "last_name_readingが空だと登録できない" do
        
      end
      it "first_name_readingが空だと登録できない" do
        
      end
      it "birthdayが空だと登録できない" do
        
      end
    end
  end
end
