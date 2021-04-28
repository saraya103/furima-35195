FactoryBot.define do
  factory :log do
    postal_number { '000-0000' }
    prefecture { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    tel { Faker::Number.leading_zero_number(digits: 11) }
    token { Faker::Lorem.sentence }
  end
end
