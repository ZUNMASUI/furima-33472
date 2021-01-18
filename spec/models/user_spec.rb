require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '内容に問題ない場合' do

   it 'nicknameとemail、passwordとpassword_confirmation,last_name,first_name,last_name_kana,first_name,kana,birthdayが存在すれば登録できること' do
    expect(@user).to be_valid
   end
   it 'passwordが6文字以上の半角英数であれば登録できること' do
    @user.password = 'a12345'
    @user.password_confirmation = 'a12345'
    expect(@user).to be_valid
   end
  end
  context '内容に問題がある場合' do
   it 'nicknameが空では登録できないこと' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end
   it 'emailが空では登録できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end

   it 'passwordが空では登録できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it 'passwordが5文字以下であれば登録できないこと' do
    @user.password = '12345'
    @user.password_confirmation = '12345'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
   end

   it '半角英語のみだと登録できないこと' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers", "Password confirmation is invalid. Password Include both letters and numbers")
   end

   it 'passwordは全角英数混合（6桁）は登録できない' do
    @user.password = 'S１1234'
    @user.password_confirmation = 'S１1234'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers", "Password confirmation is invalid. Password Include both letters and numbers")
   end
   it 'passwordは数字のみ（6桁）は登録できない' do
    @user.password = '111111'
    @user.password_confirmation = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers", "Password confirmation is invalid. Password Include both letters and numbers")
   end

   it 'emailは@がない場合は登録できない' do
    @user.email = 111
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
   end

   it '重複したemailが存在する場合登録できないこと' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
   end

   it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it 'last_nameが空では登録できないこと' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
   end
   it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.last_name = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
   end
   it 'first_nameが空では登録できないこと' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
   end
   it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.first_name = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
   end
   it 'last_name_kanaが空では登録できないこと' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
   end
   it 'last_name_kanaは全角（カタカナ）での入力が必須であること' do
    @user.last_name_kana = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
   end
   it 'first_name_kanaが空では登録できないこと' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
   end
   it 'first_name_kanaは全角（カタカナ）での入力が必須であること' do
    @user.first_name_kana = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
   end
   it 'birthdayが空では登録できないこと' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
   end
  end
end
