FactoryBot.define do
  factory :customer do
    name { FFaker::Name.name }
    phone_number { FFaker::PhoneNumber.short_phone_number }
    notes { FFaker::Lorem.paragraph }
  end
end
