require 'rails_helper'

RSpec.describe "Comments", type: :system do
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
    @post = Post.create(
      images: [Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/system/file/kkk.jpg'))],
      profile_id: @profile.id
    )
  end

  it "Postのコメント投稿", js: true do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    find('ul.post-list > li.post-item:nth-child(1) > a').click

    fill_in "post_comment[content]", with: "サンプル"
    click_on "送信"

    sleep 5

    #save_and_open_page
    expect(page).to have_content "サンプル"
    #response.code.should == “200”
  end

  it "Postのコメント投稿後、削除", js: true do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    find('ul.post-list > li.post-item:nth-child(1) > a').click

    fill_in "post_comment[content]", with: "サンプル"
    click_on "送信"

    sleep 5

    click_on "×"

    expect(page).not_to have_content "サンプル"
  end

  it "Productのコメント投稿" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    visit new_product_path
    fill_in "product[name]", with: "sample_product"
    attach_file "product[product_images][]", "#{Rails.root}/spec/system/file/kkk.jpg", match: :first
    fill_in "product[description]", with: "sample"

    click_on "送信"

    visit products_path
    find('ul.product-list > li.product-item:nth-child(1) > a').click

    fill_in "product_comment[content]", with: "サンプル"
    click_on "送信"

    sleep 5

    expect(page).to have_content "サンプル"
  end

  it "Productのコメント削除" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    visit new_product_path
    fill_in "product[name]", with: "sample_product"
    attach_file "product[product_images][]", "#{Rails.root}/spec/system/file/kkk.jpg", match: :first
    fill_in "product[description]", with: "sample"

    click_on "送信"

    visit products_path
    find('ul.product-list > li.product-item:nth-child(1) > a').click

    fill_in "product_comment[content]", with: "サンプル"
    click_on "送信"

    sleep 5

    click_on "×"
    expect(page).not_to have_content "サンプル"
  end


end
