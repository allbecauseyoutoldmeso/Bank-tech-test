require './lib/transaction.rb'
require './lib/statement.rb'

class Account

  attr_reader :transactions

  def initialize
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
    w = Transaction.new(-amount)
    transactions.push w
  end

  def statement
    s = Statement.new(transactions)
    s.print_self
  end

end
