class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image
  
  validates :title,            presence: true
  validates :explanation,      presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :state_id,         presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id,  presence: true, numericality: { other_than: 1 }
  validates :region_id,        presence: true, numericality: { other_than: 1 }
  validates :shipping_date_id, presence: true, numericality: { other_than: 1 }
  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
    format: { with: /\A[0-9]+\z/ }

end
