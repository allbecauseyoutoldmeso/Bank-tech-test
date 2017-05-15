require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe '#balance' do
    it 'is zero upon initialization of account' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'increases the balance by the amount deposited' do
      account.deposit(2000)
      expect(account.balance).to eq(2000)
    end
  end

end
