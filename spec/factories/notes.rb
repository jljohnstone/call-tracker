FactoryBot.define do
  factory :note do
    content { FFaker::Lorem.sentence }
    association :customer
    association :user
  end
end
