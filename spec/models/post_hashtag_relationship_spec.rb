require 'rails_helper'

RSpec.describe PostHashtagRelationship, type: :model do
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
      content:"#sss",
      profile_id: @profile.id
    )
    hashtag = @post.content.delete("#")
    @hashtag = Hashtag.find_by(hashtag: hashtag)
  end

  it "ハッシュタグと投稿の紐付け" do
    @relationship = PostHashtagRelationship.find_by(post_id: @post.id)
    expect(@relationship.hashtag_id).to eq @hashtag.id
  end
end
