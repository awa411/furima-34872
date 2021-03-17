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
    end
    context '購入できない' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが6文字以下だと購入できない' do
        @order_address.postal_code = "111-111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが8文字以上だと購入できない' do
        @order_address.postal_code = "111-11111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'state_idが1だと購入できない' do
        @order_address.state_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("State must be other than 1")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'townが空だと購入できない' do
        @order_address.town = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが英字と混合だと購入できない' do
        @order_address.phone_number = "a1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが平仮名と混合だと購入できない' do
        @order_address.phone_number = "あ1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが片仮名と混合だと購入できない' do
        @order_address.phone_number = "ア1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが漢字と混合だと購入できない' do
        @order_address.phone_number = "阿1111111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end