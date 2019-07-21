require 'rails_helper'

RSpec.describe Purpose, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "purposeを複数作成" do
    FactoryBot.create_list(:purpose,3)
    @purposes = Purpose.all
    expect(@purposes.size).to eq(3)
    @purposes.each_with_index do |pur, i|
      expect(pur.purpose).to eq "MyString#{i+1}"
    end
  end

  it "purposeの未入力" do
    purpose = Purpose.new(
      purpose:nil
    )
    purpose.valid?
    expect(purpose).to be_invalid
  end

  it "purposeが長すぎる場合" do
    content = "a" * 40
    purpose = Purpose.new(
      purpose: content
    )
    purpose.valid?
    expect(purpose).to be_invalid
  end
end
