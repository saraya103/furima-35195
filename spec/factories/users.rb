FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
  email { Faker::Internet.free_email}
  password { Faker::Internet.password(min_length: 6, mix_case: true) }
  password_confirmation { password }
  first_name { person.first.kanji }
  last_name { person.last.kanji }
  first_kana { person.first.katakana }
  last_kana { person.last.katakana }
  nickname { Faker::Name.initials(number: 2) }
  birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end