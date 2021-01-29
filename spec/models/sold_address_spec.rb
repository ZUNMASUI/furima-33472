require 'rails_helper'

RSpec.describe SoldAddress, type: :model do
  describe '商品購入動作について' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)

      @sold_address = FactoryBot.build(:sold_address,user_id: @user,item_id: @item)
    end
    context '内容に問題ない場合' do

     it 'すべての値が正しく入力されていれば保存できること' do
      expect(@sold_address).to be_valid
     end
     it 'building_numberは空でも保存できること' do
      @sold_address.building_number = nil
      expect(@sold_address).to be_valid
     end
    end
    context '内容に問題がある場合' do

     it 'postcodeが空だと保存できないこと' do
      @sold_address.postcode = nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Postcode can't be blank")
     end
     it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @sold_address.postcode = '1234567'
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
     end
     it 'shipping_prefecture_idがない場合は登録できないこと' do
      @sold_address.shipping_prefecture_id = nil
      @sold_address.valid?
      expect(@sold_address.errors[:shipping_prefecture_id]).to include('is not a number', "can't be blank")
     end
     it 'shipping_prefecture_idが1だった場合に登録が出来ないこと' do
      @sold_address.shipping_prefecture_id = 1
      @sold_address.valid?
      expect(@sold_address.errors[:shipping_prefecture_id]).to include('must be other than 1')
     end
     it 'addressが空だと保存できないこと' do
      @sold_address.address = nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Address can't be blank")
     end
     
     it 'house_numberが空だと保存できないこと' do
      @sold_address.house_number = nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("House number can't be blank")
     end
     it 'phone_numberが空だと保存できないこと' do
      @sold_address.phone_number = nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Phone number can't be blank")
     end
     it 'phone_numberがハイフンを含まない正しい形式でないと保存できないこと' do
      @sold_address.phone_number = '090-1234-12'
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Phone number is invalid. Include not hyphen(-)")
     end
     it 'phone_numberが１２桁では保存できないこと' do
      @sold_address.phone_number = '090123412345'
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Phone number is invalid. Include not hyphen(-)", "Phone number is too long (maximum is 11 characters)")
     end
     it 'phone_numberが英数混合では登録できないこと' do
      @sold_address.phone_number = '0901123aaaa'
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Phone number is invalid. Include not hyphen(-)")
     end
     it "tokenが空では登録できないこと" do
      @sold_address.token = nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Token can't be blank")
     end
     it "user_idが空では登録できないこと" do
      @sold_address.user_id = nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("User can't be blank")
     end
     it "item_idが空では登録できないこと" do
      @sold_address.item_id= nil
      @sold_address.valid?
      expect(@sold_address.errors.full_messages).to include("Item can't be blank")
     end
    end
  end
end