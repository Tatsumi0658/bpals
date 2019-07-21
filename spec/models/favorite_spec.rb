require 'rails_helper'

RSpec.describe Favorite, type: :model do
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
    @fav_user = User.create(
      email: "bar@example.com",
      password: "123456",
      uid: "123"
    )
    @fav_pro = Profile.create(
      nickname: "bar",
      image: "sample.jpg",
      user_id: @fav_user.id
    )
  end

  it "お気に入り" do
    relation = Favorite.new(
      post_id: @post.id,
      profile_id: @fav_pro.id
    )
    relation.valid?
    expect(relation).to be_valid
  end
end
