require 'rails_helper'

RSpec.describe LogOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @log_order = FactoryBot.build(:log_order, user_id: user.id, item_id: item.id)
    sleep 0.3
  end

  context '内容に問題がない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@log_order).to be_valid
    end
    it 'building_nameは空でも登録できる' do
      @log_order.building_name = ''
      expect(@log_order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postcodeが空では登録できない' do
      @log_order.postcode = ''
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeに英文字が入ると登録できない' do
      @log_order.postcode = 'a00-0000'
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Postcode input correctly')
    end
    it "postcodeの'-'の位置が異なると登録できない" do
      @log_order.postcode = '0-000000'
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Postcode input correctly')
    end
    it 'region_idが空では登録できない' do
      @log_order.region_id = ''
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("Region can't be blank")
    end
    it 'region_idが1では登録できない' do
      @log_order.region_id = 1
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Region Select')
    end
    it 'cityが空では登録できない' do
      @log_order.city = ''
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では登録できない' do
      @log_order.address = ''
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では登録できない' do
      @log_order.phone_number = ''
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが9文字以下では登録できない' do
      @log_order.phone_number = 123456789
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
    end
    it 'phone_numberが12文字以上では登録できない' do
      @log_order.phone_number = 123456789012
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'phone_numberに英文字が入ると登録できない' do
      @log_order.phone_number = 'a123456789'
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Phone number input only number')
    end
    it 'phone_numberに記号が入ると登録できない' do
      @log_order.phone_number = '#123456789'
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include('Phone number input only number')
    end
    it 'userが紐づいていないと登録できない' do
      @log_order.user_id = nil
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていないと登録できない' do
      @log_order.item_id = nil
      @log_order.valid?
      expect(@log_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
