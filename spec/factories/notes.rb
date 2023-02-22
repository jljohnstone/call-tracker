FactoryBot.define do
  factory :note do
    content { FFaker::Lorem.sentence }
    completed { :false }
    association :customer
    association :user
  end
end
