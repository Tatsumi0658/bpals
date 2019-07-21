require 'rails_helper'

RSpec.describe ProductComment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
    @profile = Profile.create(
      nickname: "foo",
      image: "sample.jpg",
      user_id: @user.id
    )
    @product = FactoryBot.create(:product)
  end

  it "コメント投稿" do
    comment = ProductComment.new(
      content: "sample",
      profile_id: @profile.id,
      product_id: @product.id
    )
    comment.valid?
    expect(comment).to be_valid
  end

  it "コメント未入力の場合" do
    comment = ProductComment.new(
      profile_id: @profile.id,
      product_id: @product.id
    )
    comment.valid?
    expect(comment).to be_invalid
  end

  it "コメントが長すぎる場合" do
    content = "a" * 300
    comment = ProductComment.new(
      content: content,
      profile_id: @profile.id,
      product_id: @product.id
    )
    comment.valid?
    expect(comment).to be_invalid
  end
end
