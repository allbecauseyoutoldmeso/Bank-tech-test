require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new(2000) }

  describe '#amount' do
    it 'returns the amount deposited or withdrawn' do
      expect(transaction.amount).to eq(2000)
    end
  end

  describe '#date' do
    it 'retuns the date on which it was created' do
      expect(transaction.date).to eq Time.now.strftime('%d/%m/%Y')
    end
  end

  describe '#is_credit' do
    it 'returns true if amount is greater than zero' do
      expect(transaction.is_credit?).to eq true
    end
  end

end
