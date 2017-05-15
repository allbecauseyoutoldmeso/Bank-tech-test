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
      expect(account.balance).to eq 2000
    end
  end

  describe '#withdrawal' do
    it 'decreases the balance by the amount withdrawn' do
      account.withdraw(500)
      expect(account.balance).to eq -500
    end
    it 'raises an error if withdrawal exceeds overdraft limit' do
      expect { account.withdraw(2001) }.to raise_error 'Transaction denied.'
    end
  end

  describe '#statement' do
    it "should output a statement in the correct format" do
      account.deposit(2000)
      account.withdraw(500)
      expect { account.statement }.to output("date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 1500.00\n#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 2000.00\n").to_stdout
    end
  end

end
