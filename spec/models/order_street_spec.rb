require 'rails_helper'

RSpec.describe OrderStreet, type: :model do
  describe '購入情報の保存' do
    before do
      @orderstreet = FactoryBot.build(:order_street)
    end
  
    it '必要な情報を適切に入力すると、商品の購入ができること' do
      @orderstreet = build(:order_street)
      expect(@orderstreet).to be_valid
    end

    it '郵便番号(postal_code)が必須であること' do
      @orderstreet.postal_code = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:postal_code]).to include("can't be blank")
    end

    it '都道府県(delivery_area_id)が必須であること' do
      @orderstreet.delivery_area_id = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:delivery_area_id]).to include("can't be blank")
    end

    it '市区町村(municipality)がが必須であること' do
      @orderstreet.municipality = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:municipality]).to include("can't be blank")
    end

    it '番地(address)が必須であること' do
      @orderstreet.address = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:address]).to include("can't be blank")
    end

    it '電話番号(phone_number)が必須であること' do
      @orderstreet.phone_number = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:phone_number]).to include("can't be blank")
    end

    it '郵便番号(postal_code)にはハイフンが必要であること' do
      @orderstreet.postal_code = 1234567
      @orderstreet.valid?
      expect(@orderstreet.errors[:postal_code]).to include("is invalid. Include hyphen(-)")
    end

    it '電話番号(phone_number)にはハイフンがあると登録できないこと' do
      @orderstreet.phone_number = '090-111-111'
      @orderstreet.valid?
      expect(@orderstreet.errors[:phone_number]).to include("is invalid")
    end

    it '電話番号(phone_number)は11桁以内でなければ登録できないこと' do
      @orderstreet.phone_number = '012345678901'
      @orderstreet.valid?
      expect(@orderstreet.errors[:phone_number]).to include("is invalid")
    end

    it 'user_idがなければ購入ができないこと' do
      @orderstreet.user_id = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:user_id]).to include("can't be blank")
    end

    it 'item_idがなければ購入ができないこと' do
      @orderstreet.item_id = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:item_id]).to include("can't be blank")
    end

    it 'トークンが生成されなかった場合は、カード決済ができないこと' do
      @orderstreet.token = nil
      @orderstreet.valid?
      expect(@orderstreet.errors[:token]).to include("can't be blank")
    end

    it 'delivery_area_idが1(--)であった場合は出品できない' do
      @orderstreet.delivery_area_id = 1
      @orderstreet.valid?
      expect(@orderstreet.errors[:delivery_area_id]).to include('must be other than 1')
    end

    it 'building（建物情報）がなくても登録できること' do
      @orderstreet.building = nil
      @orderstreet.valid?
    end

  end
end
