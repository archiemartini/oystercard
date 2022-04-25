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
  

  describe "#intialize" do
    it 'intializes with zero balance' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
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
end

# customer, money, a card 
# customers can add money to card 
# oystercard = Oystercard.new /
# oystercard.top_up(amount)
# balance += amount 
