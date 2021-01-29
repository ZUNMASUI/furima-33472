FactoryBot.define do
  factory :sold_address do
    transient do
      add { Gimei.address }
    end
   postcode { "123-4567" }
   shipping_prefecture_id   { 2 }
   address { add.city.kanji }
   house_number {'２−１−５５'}  
   building_number { '難波ビル２０１号' }
   phone_number { "09012345678" }
   user_id { "2"}
   item_id { "3" }
   token {"tok_abcdefghijk00000000000000000"}
  end
end
