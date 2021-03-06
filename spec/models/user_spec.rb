require 'rails_helper'
require 'date'

RSpec.describe User, type: :model do
  before  do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it 'nickname、email、password、confirmation_password、本人確認が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録がきない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("「ニックネーム」を入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '既に保存されたemailは登録できない' do
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = @user.email
        user1.valid?
        expect(user1.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it '@を含まないemailは登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '1111a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordとpassword_confirmationが相違していると登録できない' do
        @user.password = '111111a'
        @user.password_confirmation = '111111b'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("「苗字」を入力してください")
      end
      it 'last_nameに数字が含まれていると登録できない' do
        @user.last_name = '1田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('「苗字」は不正な値です')
      end
      it 'last_nameに英字が含まれていると登録できない' do
        @user.last_name = 'a田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('「苗字」は不正な値です')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("「名前」を入力してください")
      end
      it 'first_nameに数字が含まれていると登録できない' do
        @user.first_name = '1太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('「名前」は不正な値です')
      end
      it 'first_nameに英字が含まれていると登録できない' do
        @user.first_name = 'a太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('「名前」は不正な値です')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("「苗字(カナ)」を入力してください")
      end
      it 'last_name_kanaに漢字が含まれていると登録できない' do
        @user.last_name_kana = 'タ中'
        @user.valid?
        expect(@user.errors.full_messages).to include('「苗字(カナ)」は不正な値です')
      end
      it 'last_name_kanaに平仮名が含まれていると登録できない' do
        @user.last_name_kana = 'タなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('「苗字(カナ)」は不正な値です')
      end
      it 'last_name_kanaに英字が含まれていると登録できない' do
        @user.last_name_kana = 'タnaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('「苗字(カナ)」は不正な値です')
      end
      it 'last_name_kanaに数字が含まれていると登録できない' do
        @user.last_name_kana = 'タナカ1'
        @user.valid?
        expect(@user.errors.full_messages).to include('「苗字(カナ)」は不正な値です')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("「名前(カナ)」を入力してください")
      end
      it 'first_name_kanaに漢字が含まれていると登録できない' do
        @user.first_name_kana = 'タ郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('「名前(カナ)」は不正な値です')
      end
      it 'first_name_kanaに平仮名が含まれていると登録できない' do
        @user.first_name_kana = 'タろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('「名前(カナ)」は不正な値です')
      end
      it 'first_name_kanaに英字が含まれていると登録できない' do
        @user.first_name_kana = 'タrou'
        @user.valid?
        expect(@user.errors.full_messages).to include('「名前(カナ)」は不正な値です')
      end
      it 'first_name_kanaに数字が含まれていると登録できない' do
        @user.first_name_kana = 'タロウ1'
        @user.valid?
        expect(@user.errors.full_messages).to include('「名前(カナ)」は不正な値です')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("「生年月日」を入力してください")
      end
    end
  end
end
