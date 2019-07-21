require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "ユーザー登録" do
    User.create(
      email: "foo@example.com",
      password: "123456"
    )
  end

  it "Email未入力" do
    user = User.new(password: "123456")
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "Password未入力" do
    user= User.new(email: "foo@example.com")
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "Passwordの文字数が足りない" do
    user= User.new(
      email: "foo@example.com",
      password: "12345"
    )
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "すでに登録されたユーザーを登録する" do
    User.create(
      email: "foo@example.com",
      password:"123456"
    )
    user= User.new(
      email: "foo@example.com",
      password: "12345"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

end
