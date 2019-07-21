require 'rails_helper'

RSpec.describe Profile, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "Profileの登録" do
    Profile.create(
      nickname: "foo",
      image: "sample.jpg",
      user_id: 1
    )
  end

  it "Profileのニックネームがnilの場合" do
    profile = Profile.new(
      nickname: nil,
      age: 1,
      skintype: 2,
      user_id: 1
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
