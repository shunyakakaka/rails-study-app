require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.create(:record)
  end

  it "recordのidが1であること" do
    expect(@record.id).to eq 1
  end
end
