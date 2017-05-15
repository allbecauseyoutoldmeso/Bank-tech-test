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

  # def statement_array
  #   fomatted_transactions = []
  #   running_total = 0
  #   transactions.each do |transaction|
  #     fomatted_transactions.push "#{transaction.statement_string} #{sprintf("%.2f", running_total += transaction.amount)}"
  #   end
  #   fomatted_transactions
  # end

  def statement
    s = Statement.new(transactions)
    s.print_self
    # puts "date || credit || debit || balance"
    # statement_array.reverse.each do |formatted_transaction|
    #   puts formatted_transaction
    # end
  end

end
