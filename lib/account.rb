require './lib/transaction.rb'
require './lib/statement.rb'

class Account

  attr_reader :transactions, :overdraft_limit
  OVERDRAFT_LIMIT = -2000

  def initialize(overdraft_limit = OVERDRAFT_LIMIT)
    @overdraft_limit = overdraft_limit
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
    raise 'Please deposit a valid amount.' if amount <= 0
    d = Transaction.new(amount)
    transactions.push d
  end

  def withdraw(amount)
    raise 'Please withdraw a valid amount.' if amount <= 0
    raise 'This sum exceeds your overdraft limit.' if exceeds_overdraft?(amount)
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

  def exceeds_overdraft?(amount)
    balance - amount < overdraft_limit
  end

end
