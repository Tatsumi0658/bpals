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
      password: "123456",
      admin_flag: true
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

  before do
    @post = Post.create(
      images: [Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/features/file/kkk.jpg'))],
      profile_id: @profile.id
    )
  end

  #scenario "Postのコメント投稿", js: true do
  #  visit new_user_session_path
  #  fill_in "user_email", with: "foobar@example.com"
  #  fill_in "user_password", with: "123456"
  #  click_on "Log in"

  #  find('ul.post-list > li.post-item:nth-child(1) > a').click

  #  fill_in "post_comment[content]", with: "サンプル"
  #  click_on "post"

  #  sleep 5

    #save_and_open_page
  #  expect(page).to have_content "サンプル"
    #response.code.should == “200”
  #end

  scenario "Productの投稿" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    visit new_product_path
    fill_in "product[name]", with: "sample_product"
    attach_file "product[product_images][]", "#{Rails.root}/spec/features/file/kkk.jpg", match: :first
    fill_in "product[description]", with: "sample"

    click_on "post"

    expect(page).to have_current_path(products_path)
  end

  scenario "Logout" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    click_on "Logout"

    expect(page).to have_current_path(root_path)
  end
end
