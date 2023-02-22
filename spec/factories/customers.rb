FactoryBot.define do
  factory :customer do
    name { FFaker::Name.name }
    phone_number { FFaker::PhoneNumber.short_phone_number }
  end
end
