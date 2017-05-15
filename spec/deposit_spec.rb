require 'deposit'

describe Desposit do

  subject(:deposit) { described_class.new(2000) }

  describe '#amount' do
    it 'returns the amount deposited' do
      expect(deposit.amount).to eq(2000)
    end
  end

end
