require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname...birthdayまで全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英数字混合で登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailだと保存ができない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@がなければ登録できない' do
        @user.email = '123.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字の混合が必須（６文字以上）です')
      end
      it 'passwordは英語のみだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字の混合が必須（６文字以上）です')
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '1234abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'last_nameが全角表記ではないと登録できない' do
        @user.last_name = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角入力してください')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を入力してください')
      end
      it 'first_nameが全角表記ではないと登録できない' do
        @user.first_name = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角入力してください')
      end
      it 'last_name_readingが空だと登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）を入力してください')
      end
      it 'last_name_readingが全角カナ表記ではないと登録できない' do
        @user.last_name_reading = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（フリガナ）は全角カナ入力してください')
      end
      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）を入力してください')
      end
      it 'first_name_readingが全角カナ表記ではないと登録できない' do
        @user.first_name_reading = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（フリガナ）は全角カナ入力してください')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
