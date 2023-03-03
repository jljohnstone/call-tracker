FactoryBot.define do
  factory :customer do
    name { FFaker::Name.name }
    phone_number { FFaker::PhoneNumber.short_phone_number }

    factory :customer_with_invalid_phone_number do
      phone_number { "123123123" }
    end
  end
end
