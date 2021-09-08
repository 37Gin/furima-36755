class LogOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :address, :building_name, :phone_number, :log_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "input correctly" }
    validates :region_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "input only number" }
    validates :token
  end

  def save
    log = Log.create(user_id: user_id, item_id: item_id)
    Order.create(postcode: postcode, region_id: region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, log_id: log.id)
  end
end