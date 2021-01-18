class Item < ApplicationRecord

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
  end
  has_one_attached :image
end
