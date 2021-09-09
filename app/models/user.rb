class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  validates :nickname, presence: true
  validates :last_name_kanji,
            format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters' },
            presence: true
  validates :first_name_kanji,
            format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters' },
            presence: true
  validates :last_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' },
            presence: true
  validates :first_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' },
            presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :logs
end
