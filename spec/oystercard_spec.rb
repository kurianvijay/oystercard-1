require "oystercard"

describe Oystercard do
  it "checks that the new card has a balance of 0 by default" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end
end
