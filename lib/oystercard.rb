
class Oystercard
  
  MAXIMUM_BALANCE = 100

  attr_reader :balance

  def initialize
  @balance = 0
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