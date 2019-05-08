require "oystercard"

describe Oystercard do
  it "checks that the new card has a balance of 0 by default" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end
  it "can be topped up" do
    card = Oystercard.new
    card.top_up(10)
    expect(card.balance).to eq 10
  end
end
