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
end
