require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "is valid with valid attributes" do
    order = Order.new(
      user_id: user.id,
      pickup_address: "Rua A",
      delivery_address: "Rua B",
      item_description: "Item 1, Item 2",
      estimated_price: 50.0,
      requested_at: Time.current
    )
    expect(order).to be_valid
  end

  it "is invalid without a user_id" do
    order = Order.new(user_id: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without a pickup_address" do
    order = Order.new(pickup_address: nil)
    expect(order).to_not be_valid
  end

  it "is invalid without a delivery_address" do
    order = Order.new(delivery_address: nil)
    expect(order).to_not be_valid
  end

  it "is invalid with a value less than or equal to zero" do
    order = Order.new(estimated_price: 0)
    expect(order).to_not be_valid
  end
end
