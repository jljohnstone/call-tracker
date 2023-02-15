FactoryBot.define do
  factory :phone_call do
    association :customer
    association :user
  end
end
