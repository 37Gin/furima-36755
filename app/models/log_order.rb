class LogOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :address, :building_name, :phone_number, :log_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: \A\d{3}[-]\d{4}\z }
    validates :region_id
    validates :city
    validates :address
    validates :phone_number, format: { with: \A\d{3}[-]?\d{4}\z }
    validates :log_id
  end

  def save
    log = Log.create(user_id: user_id, item_id: item_id)
    Order.create(postcode: postcode, region_id: region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, log_id: log.id)
  end
end