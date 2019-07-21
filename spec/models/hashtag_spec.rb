require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
    @profile = Profile.create(
      nickname: "foo",
      image: "sample.jpg",
      user_id: @user.id
    )
  end

  it "ハッシュタグの作成" do
    @post = Post.create(
      images: ["sample.jpg"],
      content:"#sss",
      profile_id: @profile.id
    )
    hashtag = @post.content.delete("#")
    @hashtag = Hashtag.find_by(hashtag: hashtag)
    expect(@hashtag.hashtag).to eq hashtag
  end
end
