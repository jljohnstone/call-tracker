FactoryBot.define do
  factory :phone_call do
    notes { FFaker::Lorem.paragraph }
    association :customer
  end
end
