require 'rails_helper'

RSpec.describe "Users", type: :system do
  it "ユーザー登録" do
    visit new_user_registration_path
    fill_in "Eメール", with: "example@example.com"
    fill_in "パスワード", with: "123456"
    fill_in "パスワード（確認用）", with: "123456"
    within '.actions' do
      click_on "Sign up"
    end
    expect(page).to have_current_path(new_profile_path)
  end

  it "未入力後ユーザー登録" do
    visit new_user_registration_path
    within '.actions' do
      click_on "Sign up"
    end
    expect(page).to have_content "Eメールを入力してください"

    fill_in "Eメール", with: "example@example.com"
    within '.actions' do
      click_on "Sign up"
    end
    expect(page).to have_content "パスワードを入力してください"

    fill_in "Eメール", with: "example@example.com"
    fill_in "パスワード", with: "123456"
    fill_in "パスワード（確認用）", with: "123456"
    within '.actions' do
      click_on "Sign up"
    end
    expect(page).to have_current_path(new_profile_path)

  end

  it "Profile登録" do
    visit new_user_registration_path
    fill_in "Eメール", with: "example@example.com"
    fill_in "パスワード", with: "123456"
    fill_in "パスワード（確認用）", with: "123456"
    within '.actions' do
      click_on "Sign up"
    end

    fill_in "profile_nickname", with: "example"
    click_on "OK"
    expect(page).to have_current_path(posts_path)
  end

  it "Profileのニックネーム未入力エラーの後、入力" do
    visit new_user_registration_path
    fill_in "Eメール", with: "example@example.com"
    fill_in "パスワード", with: "123456"
    fill_in "パスワード（確認用）", with: "123456"
    within '.actions' do
      click_on "Sign up"
    end

    click_on "OK"

    fill_in "profile_nickname", with: "example"
    click_on "OK"
    expect(page).to have_current_path(posts_path)
  end

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

  it "Logout" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    click_on "ログアウト"

    expect(page).to have_current_path(root_path)
  end


end
