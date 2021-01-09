require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '#create' do
  before do
    @item = FactoryBot.build(:item)
  end
  
  context "正常系のテスト" do
  it '必要な情報を適切に入力すると、商品の出品ができること' do
    expect(@item).to be_valid
  end
  end

context "異常系のテスト" do
  it 'item_nameが存在しないと出品できない' do
    @item.item_name = nil
    @item.valid?
    expect(@item.errors[:item_name]).to include("can't be blank")
  end

  it 'item_descriptionが存在しないと出品できない' do
    @item.item_description = nil
    @item.valid?
    expect(@item.errors[:item_description]).to include("can't be blank")
  end

  it 'category_idがないと出品できない' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors[:category_id]).to include("can't be blank")
  end

  it 'category_idの選択肢が1(--)であった場合は出品できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors[:category_id]).to include('must be other than 1')
  end

  it 'shipping_charge_idがないと出品できない' do
    @item.shipping_charge_id = nil
    @item.valid?
    expect(@item.errors[:shipping_charge_id]).to include("can't be blank")
  end

  it 'shipping_charge_idの選択肢が1(--)であった場合は出品できない' do
    @item.shipping_charge_id = 1
    @item.valid?
    expect(@item.errors[:shipping_charge_id]).to include('must be other than 1')
  end

  it 'days_to_ship_idがないと出品できない' do
    @item.days_to_ship_id = nil
    @item.valid?
    expect(@item.errors[:days_to_ship_id]).to include("can't be blank")
  end

  it 'days_to_ship_idが1(--)であった場合は出品できない' do
    @item.days_to_ship_id = 1
    @item.valid?
    expect(@item.errors[:days_to_ship_id]).to include('must be other than 1')
  end

  it 'delivery_area_idがないと出品できない' do
    @item.delivery_area_id = nil
    @item.valid?
    expect(@item.errors[:delivery_area_id]).to include("can't be blank")
  end

  it 'delivery_area_idが1(--)であった場合は出品できない' do
    @item.delivery_area_id = 1
    @item.valid?
    expect(@item.errors[:delivery_area_id]).to include('must be other than 1')
  end

  it 'item_condition_idがないと出品できない' do
    @item.item_condition_id = nil
    @item.valid?
    expect(@item.errors[:item_condition_id]).to include("can't be blank")
  end

  it 'item_condition_idが1(--)であった場合は出品できない' do
    @item.item_condition_id = 1
    @item.valid?
    expect(@item.errors[:item_condition_id]).to include('must be other than 1')
  end

  it 'priceがないと出品できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors[:price]).to include("can't be blank")
  end

  it '販売価格は半角数字以外では登録できないこと' do
    @item.price = "１００００"
    @item.valid?
    expect(@item.errors[:price]).to include('is not a number')
  end

  it '商品画像を1枚つけることが必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors[:image]).to include("can't be blank")
  end

  it '価格の範囲が、¥300-¥9,999,999の間であること' do
     @item.price = 299
     @item.valid?
     expect(@item.errors[:price]).to include("must be greater than or equal to 300")
  end

  it '価格の範囲が、¥300-¥9,999,999の間であること' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors[:price]).to include("must be less than 9999999")
  end
end
end
