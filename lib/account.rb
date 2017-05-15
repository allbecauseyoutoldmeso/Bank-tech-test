require './lib/deposit.rb'

class Account

  def initialize
    @transactions = []
  end

  def balance
    total = 0
    @transactions.each do |transaction|
      total += transaction.amount
    end
    total
  end



  def deposit(amount)
    d = Deposit.new(amount)
    @transactions.push d
  end

end
