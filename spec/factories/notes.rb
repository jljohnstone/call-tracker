FactoryBot.define do
  factory :note do
    content { FFaker::Lorem.sentence }
    association :phone_call
  end
end
