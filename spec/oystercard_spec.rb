require 'oystercard'

describe Oystercard do

  it 'can create an instance of the class' do
    oystercard = Oystercard.new
    expect(oystercard).to be_kind_of(Oystercard)
  end

  
  # it 'fails when maximum balance is exceeded' do
  #   oyster = Oystercard.new
  #   maximum = oyster.max_balance
  #   amount = maximum + 1
    
  #   expect { oyster.top_up(amount)}.to raise_error("Exceeds maximum balance of #{maximum}")
  # end
    # it 'capacity is equal to Default Capacity if no argument is given' do
    #   expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    # end
  ##  write tests for in_journey?, touch_in and touch_out
  
  
  # In order to get through the barriers.
  # As a customer
  # I need to touch in and out.
  

  describe "#intialize" do
    it 'intializes with zero balance' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
    end
    it 'initializes not in journey state' do
      oystercard = Oystercard.new
      expect(oystercard.in_journey?).to eq 'not in use'
    end
  end
  
  describe '#top_up' do
    it 'checks to see if object responds to top_up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'tops up' do
    oystercard = Oystercard.new
    amount = 10
    expect(oystercard.top_up(amount)).to eq(10)
    end 

    it 'increases the balance by amount' do
    oystercard = Oystercard.new
    amount = 10
    oystercard.top_up(amount)
    expect(oystercard.balance).to eq(10)
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error 'Maximum balance exceeded'
    end    
  end

  describe '#deduct' do
      it 'checks to see if object responds to top_up' do
        expect(subject).to respond_to(:deduct).with(1).argument
      end
      it 'deducts an amount from the balance' do
        oyster = Oystercard.new
        oyster.top_up(100)
        deduction = 20
        oyster.deduct(deduction)
        expect(oyster.balance).to eq(80)
      end
    end

    describe '#in_journey?' do
    it 'can respond to the method in journey' do
      expect(subject).to respond_to(:in_journey?)
    end
    it 'checks the status of the card' do
    oystercard = Oystercard.new
    expect(subject.in_journey?).to eq('not in use')
    end
  end

    describe '#touch_in' do
      it 'changes journey state of oystercard' do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq('in use')
    end
  end

  describe '#touch_out' do
    it 'reverts journey state back to default' do
      oystercard = Oystercard.new
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq('not in use')
    end 
  end


end

# customer, money, a card 
# customers can add money to card 
# oystercard = Oystercard.new /
# oystercard.top_up(amount)
# balance += amount 

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
