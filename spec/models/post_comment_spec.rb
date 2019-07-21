require 'rails_helper'

RSpec.describe PostComment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
    @profile = Profile.create(
      nickname: "foo",
      image: "sample.jpg",
      user_id: @user.id
    )
    @post = Post.create(
      images: ["sample.jpg"],
      content:"sss",
      profile_id: @profile.id
    )
  end

  it "コメントの投稿" do
    comment = PostComment.new(
      content: "sample",
      profile_id: @profile.id,
      post_id: @post.id
    )
    comment.valid?
    expect(comment).to be_valid
  end

  it "コメントが無記入だった場合" do
    comment = PostComment.new(
      profile_id: @profile.id,
      post_id: @post.id
    )
    comment.valid?
    expect(comment).to be_invalid
  end

  it "コメントが長すぎる場合" do
    content = "a" * 300
    comment = PostComment.new(
      content: content,
      profile_id: @profile.id,
      post_id: @post.id
    )
    comment.valid?
    expect(comment).to be_invalid
  end
end
