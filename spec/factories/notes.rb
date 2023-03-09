FactoryBot.define do
  factory :note do
    content { FFaker::Lorem.sentence }
    completed { :false }
    association :customer
    association :assigned_to_user
    association :created_by_user
    priority { :false }

    factory :priority_note do
      priority { :true }
    end
  end
end
