FactoryBot.define do
  factory :user, aliases: [ :assigned_to_user ] do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { SecureRandom.alphanumeric(12) }
    time_zone { "UTC" }
    assignable { true }
  end
end
