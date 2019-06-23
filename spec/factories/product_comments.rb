FactoryBot.define do
  factory :product_comment do
    content { "MyText" }
    product { nil }
    profile { nil }
  end
end
