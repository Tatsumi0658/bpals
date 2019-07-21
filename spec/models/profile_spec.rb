require 'rails_helper'

RSpec.describe Profile, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.create(:user)
  end

  it "Profileの登録" do
    user = @user
    profile = Profile.new(
      nickname: "foo",
      image: "sample.jpg",
      user_id: @user.id
    )
    profile.valid?
    expect(profile).to be_valid
  end

  it "Profileのニックネームがnilの場合" do
    user = @user
    profile = Profile.new(
      nickname: nil,
      age: 1,
      skintype: 2,
      user_id: @user.id
    )
    profile.valid?
    expect(profile).to be_invalid
  end

  it "user_idがnilの場合" do
    profile = Profile.new(
      nickname: "foo"
    )
    profile.valid?
    expect(profile).to be_invalid
  end
end
