require 'rails_helper'

RSpec.describe "Posts", type: :system do
  #pending "add some scenarios (or delete) #{__FILE__}"
  before do
    @user = User.create(
      email: "foobar@example.com",
      password: "123456",
      admin_flag: true
    )
    @profile = Profile.create(
      nickname: "foobar",
      user_id: @user.id
    )
  end

  it "Post投稿" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    first(".shortcut-link").click

    attach_file "post[images][]", "#{Rails.root}/spec/system/file/kkk.jpg", match: :first
    click_on "送信"
    expect(page).to have_current_path(posts_path)
  end

  it "Post投稿エラー後、投稿" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    first(".shortcut-link").click

    click_on "送信"
    expect(page).to have_content "画像を入力してください"

    attach_file "post[images][]", "#{Rails.root}/spec/system/file/kkk.jpg", match: :first
    click_on "送信"
    expect(page).to have_current_path(posts_path)
  end
end
