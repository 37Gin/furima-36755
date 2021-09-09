class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image
  has_one :log

  validates :image,            presence: true
  validates :title,            presence: true
  validates :explanation,      presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            presence: true,
            inclusion: { in: (300..9_999_999), message: 'is out of setting range' },
            numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
end
