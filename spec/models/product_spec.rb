require 'rails_helper'

RSpec.describe Product, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "Product、画像1枚で登録する場合" do
    product = Product.new(
      name: "sample",
      product_images: ["sample.jpg"]
    )
    product.valid?
    expect(product).to be_valid
  end

  it "画像2枚で登録する場合" do
    product = Product.new(
      name: "sample",
      product_images: ["sample1.jpg", "sample2.jpg"]
    )
    product.valid?
    expect(product).to be_valid
  end

  it "画像3枚で登録する場合" do
    product = Product.new(
      name: "sample",
      product_images: ["sample1.jpg", "sample2.jpg","sample3.jpg"]
    )
    product.valid?
    expect(product).to be_valid
  end

  it "商品名が空の場合" do
    product = Product.new(
      product_images:["sample1.jpg"]
    )
    product.valid?
    expect(product).to be_invalid
  end

  it "商品説明が長すぎる場合" do
    description = "a" * 400
    product = Product.new(
      name: "sample",
      product_images:["sample1.jpg"],
      description: description
    )
    product.valid?
    expect(product).to be_invalid
  end
end
