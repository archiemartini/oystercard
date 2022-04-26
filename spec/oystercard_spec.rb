require 'oystercard'

describe Oystercard do

  
  it 'can create an instance of the class' do
    oystercard = Oystercard.new
    expect(oystercard).to be_kind_of(Oystercard)
  end 

  describe "#intialize" do
    it 'intializes with zero balance' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
    end
    it 'initializes not in journey state' do
      oystercard = Oystercard.new
      expect(oystercard.in_journey?).to eq false
    end
    it 'intitalizes with an empty journey array' do
      expect(subject.journeys).to eq []
    end
    
  end
    
  describe '#top_up' do
    it 'checks to see if object responds to top_up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'tops up' do
      expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
    end

    # it 'increases the balance by amount' do
    # oystercard = Oystercard.new
    # amount = 10
    # oystercard.top_up(amount)
    # expect(oystercard.balance).to eq(10)
    # end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error 'Maximum balance exceeded'
    end    
  end

  describe '#deduct' do
      
    
    #   it 'deducts an amount from the balance' do
    #     oyster = Oystercard.new
    #     oyster.top_up(100)
    #     deduction = 20
    #     oyster.deduct(deduction)
    #     expect(oyster.balance).to eq(80)
    #   end
    end

    describe '#in_journey?' do
    it 'can respond to the method in journey' do
      expect(subject).to respond_to(:in_journey?)
    end
    it 'checks the status of the card' do
    oystercard = Oystercard.new
    expect(subject.in_journey?).to eq(false)
    end
  end

    describe '#touch_in' do
      it 'accepts one argument when called' do 
      expect(subject).to respond_to(:touch_in).with(1).argument
      end

      let(:station){double :station}
      it 'stores the entry' do 
        subject.top_up(10)
        subject.touch_in(station)
        expect(subject.entry_station).to eq station
      end

      it 'changes journey state of oystercard' do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      oystercard.touch_in(station)
      expect(oystercard.in_journey?).to eq(true)
    end
    it 'runs an error if there is no minimum balance' do
      expect{ subject.touch_in(station)}.to raise_error "Below minimum balance"
    end
  
  end

  describe '#touch_out' do
    let(:entry_station) {double :station}
    let(:exit_station) {double :station}
    it 'accepts one argument when called' do 
      expect(subject).to respond_to(:touch_out).with(1).argument
      end
    it 'reverts journey state back to default' do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      station = "Wapping"
      oystercard.touch_in(station) 
      oystercard.touch_out(station)
      expect(oystercard.in_journey?).to eq(false)
    end 
    it 'calls the deduct method and decreases the balance' do
      station = "NEw Cross"
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::STANDARD_FARE)
    end
    it 'stores exit station' do
      oyster = Oystercard.new
      oyster.top_up(10)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.exit_station).to eq exit_station
    end
    let(:journey){ {entry_station: entry_station, exit_station: exit_station } }
    it 'stores a journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
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

# let(:station){ double :station }

# it 'stores the entry station' do
#   subject.touch_in(station)
#   expect(subject.entry_station).to eq station
# end