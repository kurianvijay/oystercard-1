require "oystercard"

describe Oystercard do

  let(:card) {Oystercard.new}
  let(:station){ double :station}

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
  it "is not in journey by default" do
  card.in_journey?
  expect(card).not_to be_in_journey
  end
  it "can touch in" do
    card.top_up(5)
    card.touch_in
    expect(card).to be_in_journey
  end

  it "will let #touch_in to record entry station" do
    card.top_up(5)
    card.touch_in(station)
    expect(card.entry_station).to eq station
  end

  it "can touch out" do
    card.top_up(5)
    card.touch_in
    card.touch_out
    expect(card).not_to be_in_journey
  end


let(:exit_station){ double :exit_station}
it "while touching out records exit station" do
  card.top_up(10)
  card.touch_in (station)
  card.touch_out (exit_station)
  expect(card.exit_station).to eq exit_station
end


it "will deduct minimum fare when touching out" do
  card.top_up(5)
  card.touch_in
  expect {card.touch_out}.to change{card.balance}.by(-Oystercard::MIN_FARE)
end

  it "has minimum balance" do
    expect{card.touch_in}.to raise_error("your balance is below #{Oystercard::MIN_BALANCE} for journey")
  end
end
