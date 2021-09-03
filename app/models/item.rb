class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image
  
end
