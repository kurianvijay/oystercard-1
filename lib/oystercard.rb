class Oystercard
attr_reader :balance, :in_journey, :entry_station
MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_FARE = 2
def initialize
  @balance = 0
  @in_journey = false
  @entry_station = nil
end

def deduct (amount)
  @balance-=amount
end

def in_journey?
  !!@entry_station
end

def top_up (amount)
 raise "top up would exceed limit of #{MAX_BALANCE}" if @balance+amount > MAX_BALANCE
 @balance+=amount
end

def touch_in(station = ' ')
raise "your balance is below #{MIN_BALANCE} for journey" if @balance < MIN_BALANCE
  @in_journey = true
  @entry_station = station
end

def touch_out
  #@in_journey = false
  @entry_station = nil
  deduct(MIN_FARE)
end
end


#write private method for if conditions
