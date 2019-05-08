require "oystercard"

describe Oystercard do
  let(:card) {Oystercard.new}
  it "checks that the new card has a balance of 0 by default" do
    expect(card.balance).to eq 0
  end
  it "can be topped up" do
    card.top_up(10)
    expect(card.balance).to eq 10
  end
  it "can be topped up to maximum of maximum limit" do
    expect{card.top_up(100)}.to raise_error("top up would exceed limit of #{Oystercard::MAX_BALANCE}")
  end
  it "money can be deducted from balance" do
    card.top_up(20)
    card.deduct(10)
    expect(card.balance).to eq 10
  end
end
