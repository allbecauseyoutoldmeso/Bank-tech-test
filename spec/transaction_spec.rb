require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new(2000) }

  describe '#amount' do
    it 'returns the amount deposited' do
      expect(transaction.amount).to eq(2000)
    end
  end

  describe '#date' do
    it 'retuns the date on which it was created' do
      expect(transaction.date).to eq Time.now.strftime('%d/%m/%Y')
    end
  end

end
