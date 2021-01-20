class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_days
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture

  validates :category_id,:condition_id,:shipping_days_id,:shipping_fee_id,:shipping_prefecture_id, numericality: { other_than: 1 } 
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
    validates :condition_id 
    validates :shipping_fee_id
    validates :shipping_prefecture_id
    validates :shipping_days_id
    validates :price
    validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, format:{ with: /\A[0-9]+\z/, message: 'It is invalid. Price includes double-byte numbers' }
  has_one_attached :image
end
