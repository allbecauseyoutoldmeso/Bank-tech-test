require 'statement'

describe Statement do

  let(:transaction_1) { double:transaction, statement_string: "#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || ||", amount: 2000 }
  let(:transaction_2) { double:transaction, statement_string: "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 ||", amount: -500 }

  subject(:statement) { described_class.new([transaction_1, transaction_2])}


  describe '#format_transactions' do
    it 'returns a list of formatted transactions' do
      expect(statement.format_transactions).to eq ["#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 2000.00", "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 1500.00"]
    end
  end

  describe '#print_self' do
    it 'prints a statement in the correct format' do
      expect { statement.print_self }.to output("date || credit || debit || balance\n#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 1500.00\n#{Time.now.strftime('%d/%m/%Y')} || 2000.00 || || 2000.00\n").to_stdout
    end
  end

end
