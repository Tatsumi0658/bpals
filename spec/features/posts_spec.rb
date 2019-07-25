require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  #pending "add some scenarios (or delete) #{__FILE__}"
  scenario "ユーザー登録" do
    visit new_user_registration_path
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    within '.actions' do
      click_on "Sign up"
    end
    expect(page).to have_current_path(new_profile_path)
  end

  scenario "Profile登録" do
    visit new_user_registration_path
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    within '.actions' do
      click_on "Sign up"
    end

    fill_in "Nickname", with: "example"
    click_on "post"
    expect(page).to have_current_path(posts_path)
  end


  before do
    @user = User.create(
      email: "foobar@example.com",
      password: "123456"
    )
    @profile = Profile.create(
      nickname: "foobar",
      user_id: @user.id
    )
  end

  scenario "Post投稿" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    click_on(class: "btn btn-plus")

    attach_file "post[images][]", "#{Rails.root}/spec/features/file/kkk.jpg", match: :first
    click_on "post"
    expect(page).to have_current_path(posts_path)
  end
end
