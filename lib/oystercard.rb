
class Oystercard
  
  MAXIMUM_BALANCE = 100

  attr_reader :balance
  attr_reader :journey_status

  def initialize
    @journey_status = 'not in use'
    @balance = 0
  end 

  def in_journey?
    @journey_status
  end

  def touch_in
    self.instance_variable_set(:@journey_status, 'in use')
  end

  def touch_out
    self.instance_variable_set(:@journey_status, 'not in use')
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if @balance + amount > MAXIMUM_BALANCE 
    @balance += amount
  end
   def deduct(amount)
    @balance -= amount
   end 
end

# expect{ subject.deduct 3}.to change{ subject.balance }.by -3

# self.instance_variable_set(:@weather, 'GOOD')