
class Oystercard
  
  MAXIMUM_BALANCE = 100
  MINIMUM_BALANCE = 1
  STANDARD_FARE = 2

  attr_reader :balance, :journey_status

  def initialize
    @in_journey_status = false
    @balance = 0
  end 

  def in_journey?
    @in_journey_status
  end

  def touch_in
    fail "Below minimum balance" if @balance < MINIMUM_BALANCE
    @in_journey_status = true
  end

  def touch_out
    @in_journey_status = false
    deduct(STANDARD_FARE)
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if @balance + amount > MAXIMUM_BALANCE 
    @balance += amount
  end

  private
  
   def deduct(amount)
    @balance -= amount
   end 

  end

# expect{ subject.deduct 3}.to change{ subject.balance }.by -3

# self.instance_variable_set(:@weather, 'GOOD')