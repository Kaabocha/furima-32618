require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      @user = build(:user)
      expect(@user).to be_valid
    end

    it 'nick_nameがない場合は登録できないこと' do
      @user = build(:user, nick_name: nil)
      @user.valid?
      expect(@user.errors[:nick_name]).to include("can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      @user = build(:user, email: nil)
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      @user = build(:user, password: nil)
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'password_confirmationがない場合は登録できないこと' do
      @user = build(:user, password_confirmation: '')
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'family_nameがない場合は登録できないこと' do
      @user = build(:user, family_name: nil)
      @user.valid?
      expect(@user.errors[:family_name]).to include("can't be blank")
    end

    it 'family_name_kanaがない場合は登録できないこと' do
      @user = build(:user, family_name_kana: nil)
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("can't be blank")
    end

    it 'first_nameがない場合は登録できないこと' do
      @user = build(:user, first_name: nil)
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'first_name_kanaがない場合は登録できないこと' do
      @user = build(:user, first_name_kana: nil)
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
    end

    it 'birthdayがない場合は登録できないこと' do
      @user = build(:user, birthday: nil)
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user = create(:user)
      another_user = build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'passwordが存在してもencrypted_passwordがない場合は登録できないこと' do
      @user = build(:user, password_confirmation: '')
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user = build(:user, password: '123456', password_confirmation: '123456')
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user = build(:user, password: '12345', password_confirmation: '12345')
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'family_nameが全角入力でなければ登録できないこと' do
      @user = build(:user, family_name: 'ｱｲｳｴｵ')
      @user.valid?
      expect(@user.errors[:family_name]).to include('is invalid')
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user = build(:user, first_name: 'ｱｲｳｴｵ')
      @user.valid?
      expect(@user.errors[:first_name]).to include('is invalid')
    end

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user = build(:user, family_name_kana: 'あいうえお')
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include('is invalid')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user = build(:user, first_name_kana: 'あいうえお')
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include('is invalid')
    end
  end
end
