FactoryBot.define do
  factory :product do
    name { "MyString" }
    product_images { ["sample.jpg"] }
    description { "MyText" }
  end
end
