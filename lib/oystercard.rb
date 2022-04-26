
class Oystercard
  
  MAXIMUM_BALANCE = 100
  MINIMUM_BALANCE = 1
  STANDARD_FARE = 2

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @journey = {}
  end 

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Below minimum balance" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    @journey[:entry_station] = @entry_station
    @entry_station = nil
    @exit_station = station
    @journey[:exit_station] = @exit_station
    @journeys << @journey
    @journey = {}
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