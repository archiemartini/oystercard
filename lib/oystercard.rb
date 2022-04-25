
class Oystercard
  
  MAXIMUM_BALANCE = 100

  attr_reader :balance
  attr_reader :max_balance

  def initialize(max_balance=MAXIMUM_BALANCE)
  @balance = 0
  @max_balance = max_balance
  end 

  def top_up(amount)
    fail "Maximum balance exceeded" if @balance + amount > MAXIMUM_BALANCE 
    @balance += amount
  end

end