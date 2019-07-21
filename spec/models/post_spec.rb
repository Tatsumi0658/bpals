require 'rails_helper'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
    @profile = Profile.create(
      nickname: "foo",
      image: "sample.jpg",
      user_id: @user.id
    )
  end

  it "画像1枚投稿時" do
    post = Post.new(
      images: ["sample.jpg"],
      profile_id: @profile.id
    )
    post.valid?
    expect(post).to be_valid
  end

  it "画像2枚投稿時" do
    post = Post.new(
      images: ["sample1.jpg", "sample2.jpg"],
      profile_id: @profile.id
    )
    post.valid?
    expect(post).to be_valid
  end

  it "画像3枚投稿時" do
    post = Post.new(
      images: ["sample1.jpg", "sample2.jpg", "sample3.jpg"],
      profile_id: @profile.id
    )
    post.valid?
    expect(post).to be_valid
  end

  it "画像が未入力の場合" do
    post = Post.new(
      content: "サンプル",
      profile_id: @profile.id
    )
    post.valid?
    expect(post).to be_invalid
  end

  it "profile_idがnilの場合" do
    post = Post.new(
      images: ["sample.jpg"],
      content: "サンプル"
    )
    post.valid?
    expect(post).to be_invalid
  end

  it "300文字以上のコンテンツが投稿された場合" do
    content = "a" * 301
    post = Post.new(
      images: ["sample.jpg"],
      content: content,
      profile_id: @profile.id
    )
    post.valid?
    expect(post).to be_invalid
  end
end
