FactoryBot.define do
  factory :user do
    email { "foo@example.com" }
    password { "123456" }
    password_confirmation { "123456" }
    uid { 1 }
    admin_flag { true }
  end
end
