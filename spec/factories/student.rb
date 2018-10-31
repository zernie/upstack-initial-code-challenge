FactoryBot.define do
  factory :student do
    sequence(:first_name) { |n| "Joe#{n}" }
    sequence(:last_name) { |n| "Bloggs#{n}" }
    match false
  end
end