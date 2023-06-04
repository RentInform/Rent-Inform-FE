FactoryBot.define do
  factory :user do
    google_id { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    token { Faker::Internet.device_token }
  end
 end
 