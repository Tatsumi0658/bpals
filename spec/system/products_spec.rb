require 'rails_helper'

RSpec.describe "Products", type: :system do
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

  it "Productの投稿" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    visit new_product_path
    fill_in "product[name]", with: "sample_product"
    attach_file "product[product_images][]", "#{Rails.root}/spec/system/file/kkk.jpg", match: :first
    fill_in "product[description]", with: "sample"

    click_on "post"

    expect(page).to have_current_path(products_path)
  end

  it "Productの名前を未入力エラー後、入力" do
    visit new_user_session_path
    fill_in "user_email", with: "foobar@example.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"

    visit new_product_path
    click_on "post"
    expect(page).to have_content "Nameを入力してください"

    visit new_product_path
    fill_in "product[name]", with: "sample_product"
    attach_file "product[product_images][]", "#{Rails.root}/spec/system/file/kkk.jpg", match: :first
    fill_in "product[description]", with: "sample"

    click_on "post"

    expect(page).to have_current_path(products_path)
  end
end
