FactoryBot.define do
  factory :item do
    title { 'ぬいぐるみ' }
    explanation { 'とても可愛らしいぬいぐるみです' }
    category_id              { 2 }
    condition_id             { 2 }
    shipping_fee_id          { 2 }
    shipping_prefecture_id   { 2 }
    shipping_days_id         { 2 }
    price                    { 350 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
