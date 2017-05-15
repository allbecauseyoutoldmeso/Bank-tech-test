require './lib/transaction.rb'
require './lib/statement.rb'

class Account

  attr_reader :transactions, :overdraft_limit

  def initialize(overdraft_limit = -2000)
    @overdraft_limit = -2000
    @transactions = []
  end

  def balance
    total = 0
    transactions.each do |transaction|
      total += transaction.amount
    end
    total
  end

  def deposit(amount)
    d = Transaction.new(amount)
    transactions.push d
  end

  def withdraw(amount)
    raise 'Transaction denied.' if (balance-amount) < overdraft_limit
    w = Transaction.new(-amount)
    transactions.push w
  end

  def statement
    s = Statement.new(transactions)
    s.print_self
  end

  def extend_overdraft(amount)
    self.overdraft_limit = amount
  end

  private

  attr_writer :overdraft_limit

end
