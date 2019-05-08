class Oystercard
attr_reader :balance, :in_journey
MAX_BALANCE = 90
MIN_BALANCE = 1
def initialize
  @balance = 0
  @in_journey = false
end

def top_up (amount)
 raise "top up would exceed limit of #{MAX_BALANCE}" if @balance+amount > MAX_BALANCE
 @balance+=amount
end

def deduct (amount)
  @balance-=amount
end

def in_journey?
  @in_journey
end

def touch_in
raise "your balance is below #{MIN_BALANCE} for journey" if @balance < MIN_BALANCE
  @in_journey = true
end

def touch_out
  @in_journey = false
end
end
