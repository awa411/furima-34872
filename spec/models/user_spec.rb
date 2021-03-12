require 'rails_helper'
require 'date'

RSpec.describe User, type: :model do
  before  do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、password、confirmation_password、本人確認が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '既に保存されたemailは登録できない' do
      @user.save
      user1 = FactoryBot.build(:user)
      user1.email = @user.email
      user1.valid?
      expect(user1.errors.full_messages).to include('Email has already been taken')
    end
    it '@を含まないemailは登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = '1111a'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordとpassword_confirmationが相違していると登録できない' do
      @user.password = '111111a'
      @user.password_confirmation = '111111b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameに数字が含まれていると登録できない' do
      @user.last_name = '1田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'last_nameに英字が含まれていると登録できない' do
      @user.last_name = 'a田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameに数字が含まれていると登録できない' do
      @user.first_name = '1太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'first_nameに英字が含まれていると登録できない' do
      @user.first_name = 'a太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaに漢字が含まれていると登録できない' do
      @user.last_name_kana = 'タ中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'last_name_kanaに平仮名が含まれていると登録できない' do
      @user.last_name_kana = 'タなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'last_name_kanaに英字が含まれていると登録できない' do
      @user.last_name_kana = 'タnaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'last_name_kanaに数字が含まれていると登録できない' do
      @user.last_name_kana = 'タナカ1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaに漢字が含まれていると登録できない' do
      @user.first_name_kana = 'タ郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaに平仮名が含まれていると登録できない' do
      @user.first_name_kana = 'タろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaに英字が含まれていると登録できない' do
      @user.first_name_kana = 'タrou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaに数字が含まれていると登録できない' do
      @user.first_name_kana = 'タロウ1'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
