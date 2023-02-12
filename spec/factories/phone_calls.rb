FactoryBot.define do
  factory :phone_call do
    notes { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut tortor laoreet turpis ultrices ultricies et ut diam. Ut lectus ligula, rutrum eleifend dolor vel, condimentum molestie lacus. Phasellus tristique molestie neque interdum condimentum. Fusce massa ligula, lacinia quis nisi mattis, tincidunt convallis ligula." }
    association :customer
  end
end
