FactoryBot.define do
  factory :note do
    content { FFaker::Lorem.sentence }
    done { :false }
    association :customer
    association :user
  end
end
