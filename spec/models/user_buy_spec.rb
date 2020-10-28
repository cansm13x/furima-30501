require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  describe '商品の購入' do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_buy).to be_valid
    end
    
    it 'postal_codeが空だと保存できない' do
      @user_buy.postal_code = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @user_buy.postal_code = 1234567
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Postal code is invalid")
    end

    it 'prefecture_idの情報が--の選択だと保存できない' do
      @user_buy.prefecture_id = 0
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it 'municipalityが空だと保存できない' do
      @user_buy.municipality = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Municipality can't be blank", "Municipality is invalid")
    end

    it 'addresが空だと保存できない' do
      @user_buy.addres = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Addres can't be blank", "Addres is invalid")
    end

    it 'building_nameは空でも保存できる' do
      @user_buy.building_name = ""
      expect(@user_buy).to be_valid
    end

    it 'tellが空だと保存できない' do
      @user_buy.tell = ""
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Tell can't be blank", "Tell is invalid")
    end

    it 'tellが全角数字だと保存できない' do
      @user_buy.tell = "９９０１２３４５６７８"
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Tell is invalid")
    end

    it 'tellはハイフンなしの数字11桁以内でないと保存できない' do
      @user_buy.tell = 990123456789
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Tell is invalid")
    end

    it "tokenが空では登録できないこと" do
      @user_buy.token = nil
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Token can't be blank")
    end
  end
end