FactoryBot.define do
  factory :note do
    content { FFaker::Lorem.sentence }
  end
end
