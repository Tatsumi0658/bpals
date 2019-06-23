FactoryBot.define do
  factory :post_comment do
    content { "MyText" }
    post { nil }
    profile { nil }
  end
end
