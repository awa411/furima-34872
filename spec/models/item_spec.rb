require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品を出品登録する' do
    context '出品登録に成功する' do
      it 'image、description、category_id、status_id,shipping_charge_id、state_id、day_to_ship_id、priceが正しく入力されいると成功する' do
        expect(@item).to be_valid
      end
    end
    context '出品登録に失敗する' do
      it 'imagesが空だと出品登録に失敗する' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("「商品画像」を入力してください")
      end
      it 'descriptionが空だと出品登録に失敗する' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("「商品の説明」を入力してください")
      end
      it 'category_idが「指定無し」だと出品登録に失敗する' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('「カテゴリー」を入力してください')
      end
      it 'status_idが「指定無し」だと出品登録に失敗する' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('「商品の状態」を入力してください')
      end
      it 'shipping_charge_idが「指定無し」だと出品登録に失敗する' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('「配送料の負担」を入力してくしてください')
      end
      it 'state_idが「指定無し」だと出品登録に失敗する' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('「発送元の地域」を入力してください')
      end
      it 'day_to_ship_idが「指定無し」だと出品登録に失敗する' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('「発送までの日数」を入力してください')
      end
      it 'priceが空だと出品登録に失敗する' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("「販売価格」を入力してください")
      end
      it 'priceの数値が300未満だと出品登録に失敗する' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('「販売価格」は299より大きい値にしてください')
      end
      it 'priceの数値が9999999を超えると出品登録に失敗する' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('「販売価格」は10000000より小さい値にしてください')
      end
      it 'priceの値が全角数字だと出品登録に失敗する' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('「販売価格」は数値で入力してください')
      end
      it 'priceの値が半角英字だと出品登録に失敗する' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('「販売価格」は数値で入力してください')
      end
      it 'priceの値が半角英数字混合だと出品登録に失敗する' do
        @item.price = 'a300'
        @item.valid?
        expect(@item.errors.full_messages).to include('「販売価格」は数値で入力してください')
      end
    end
  end
end
