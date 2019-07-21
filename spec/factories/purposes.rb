FactoryBot.define do
  factory :purpose do
    sequence(:purpose) { |n| "MyString#{n}" }
  end
end
