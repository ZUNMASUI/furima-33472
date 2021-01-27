class SoldAddress
  include ActiveModel::Model
  attr_accessor :postcode,:shipping_prefecture_id,:address,:house_number,:building_number,:phone_number,

  #ここにバリデーションの処理を書く
  
  #  with_options presence: true do
  #    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  #    validates :shipping_prefecture_id
  #    validates :address
  #    validates :house_number
  #    validates :phone_number, format: { with: /\A\d{11}\z/, message: "is invalid. Include not hyphen(-)" }
  #  end
  #  validates :shipping_prefecture_id,numericality: { other_than: 1 }

  def save
    #  各テーブルにデータを保存する処理を書く
    sold = Sold.create(item_id: item.id, user_id: user.id)
    Address.create(postcode: postcode, shipping_prefecture_id: shipping_prefecture_id, address: address, house_number: house_number, building_number: building_number, phone_number: phone_number,sold_id: sold.id)
  end
end