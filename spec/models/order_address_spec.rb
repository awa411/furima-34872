require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id, price: item.price)
    sleep 0.1 # 負荷軽減のため0.1秒待機
  end
  
  describe '商品購入' do
    context '購入できる' do
      it '全ての値が正しく入力されていると購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingの値が空でも購入できる' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end
    context '購入できない' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「クレジットカード情報」を入力してください")
      end
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「郵便番号」を入力してください")
      end
      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「郵便番号」は不正な値です")
      end
      it 'postal_codeが6文字以下だと購入できない' do
        @order_address.postal_code = "111-111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「郵便番号」は不正な値です")
      end
      it 'postal_codeが8文字以上だと購入できない' do
        @order_address.postal_code = "111-11111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「郵便番号」は不正な値です")
      end
      it 'state_idが1だと購入できない' do
        @order_address.state_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「都道府県」は1以外の値にしてください")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「市区町村」を入力してください")
      end
      it 'townが空だと購入できない' do
        @order_address.town = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「番地」を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「電話番号」を入力してください")
      end
      it 'phone_numberが英字と混合だと購入できない' do
        @order_address.phone_number = "a1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「電話番号」は不正な値です")
      end
      it 'phone_numberが平仮名と混合だと購入できない' do
        @order_address.phone_number = "あ1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「電話番号」は不正な値です")
      end
      it 'phone_numberが片仮名と混合だと購入できない' do
        @order_address.phone_number = "ア1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「電話番号」は不正な値です")
      end
      it 'phone_numberが漢字と混合だと購入できない' do
        @order_address.phone_number = "阿1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「電話番号」は不正な値です")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_address.phone_number = "111111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("「電話番号」は不正な値です")
      end
      it 'user_idが空だと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end