require 'rails_helper'

RSpec.describe ItemsTag, type: :model do
  before do
    user = FactoryBot.create(:user)
    @items_tag = FactoryBot.build(:items_tag, user_id: user.id)
  end
  describe '商品を出品登録する' do
    context '出品登録に成功する' do
      it 'image、description、category_id、status_id,shipping_charge_id、state_id、day_to_ship_id、priceが正しく入力されいると成功する' do
        expect(@items_tag).to be_valid
      end
    end
    context '出品登録に失敗する' do
      it 'imagesが空だと出品登録に失敗する' do
        @items_tag.images = nil
        @items_tag.valid?
        binding.pry
        expect(@items_tag.errors.full_messages).to include("「商品画像」を入力してください")
      end
      it 'descriptionが空だと出品登録に失敗する' do
        @items_tag.description = ''
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("「商品の説明」を入力してください")
      end
      it 'category_idが「指定無し」だと出品登録に失敗する' do
        @items_tag.category_id = ""
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「カテゴリー」を入力してください')
      end
      it 'status_idが「指定無し」だと出品登録に失敗する' do
        @items_tag.status_id = ""
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「商品の状態」を入力してください')
      end
      it 'shipping_charge_idが「指定無し」だと出品登録に失敗する' do
        @items_tag.shipping_charge_id = ""
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「配送料の負担」を入力してください')
      end
      it 'state_idが「指定無し」だと出品登録に失敗する' do
        @items_tag.state_id = ""
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「発送元の地域」を入力してください')
      end
      it 'day_to_ship_idが「指定無し」だと出品登録に失敗する' do
        @items_tag.day_to_ship_id = ""
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「発送までの日数」を入力してください')
      end
      it 'priceが空だと出品登録に失敗する' do
        @items_tag.price = nil
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include("「販売価格」を入力してください")
      end
      it 'priceの数値が300未満だと出品登録に失敗する' do
        @items_tag.price = 299
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「販売価格」は299より大きい値にしてください')
      end
      it 'priceの数値が9999999を超えると出品登録に失敗する' do
        @items_tag.price = 10_000_000
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「販売価格」は10000000より小さい値にしてください')
      end
      it 'priceの値が全角数字だと出品登録に失敗する' do
        @items_tag.price = '３００'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「販売価格」は数値で入力してください')
      end
      it 'priceの値が半角英字だと出品登録に失敗する' do
        @items_tag.price = 'aaa'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「販売価格」は数値で入力してください')
      end
      it 'priceの値が半角英数字混合だと出品登録に失敗する' do
        @items_tag.price = 'a300'
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「販売価格」は数値で入力してください')
      end
      it 'nameの値が空だと出品登録に失敗する' do
        @items_tag.name = ''
        @items_tag.valid?
        expect(@items_tag.errors.full_messages).to include('「タグ」を入力してください')
      end
    end
  end
end
