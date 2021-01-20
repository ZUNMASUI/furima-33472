require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '内容に問題ない場合' do
      it 'titleとexplanation、category_id、condition_id、shipping_fee_id、shipping_prefecture_id、shipping_days_id、price、imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end
      it 'priceが300ちょうどだと登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end

      it 'priceが9999999だと登録できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'titleがない場合は登録できないこと' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'explanationがない場合は登録できないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idがない場合は登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
      end

      it 'condition_idがない場合は登録できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number", "Condition can't be blank")
      end

      it 'shipping_fee_idがない場合は登録できないこと' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee is not a number", "Shipping fee can't be blank")
      end

      it 'shipping_days_idがない場合は登録できないこと' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors[:shipping_days_id]).to include("is not a number", "can't be blank")
      end

      it 'shipping_prefecture_idがない場合は登録できないこと' do
        @item.shipping_prefecture_id = nil
        @item.valid?
        expect(@item.errors[:shipping_prefecture_id]).to include("is not a number", "can't be blank")
      end
      it 'imageがない場合は登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'priceがない場合は登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank", "is out of setting range", "It is invalid. Price includes double-byte numbers")
      end

      it 'priceが299以下だと登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors[:price]).to include('is out of setting range')
      end

      it 'priceが10000000だと登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors[:price]).to include('is out of setting range')
      end
    end
  end
end
