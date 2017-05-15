class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def statement_array
    fomatted_transactions = []
    running_total = 0
    @transactions.each do |transaction|
      fomatted_transactions.push "#{transaction.statement_string} #{sprintf("%.2f", running_total += transaction.amount)}"
    end
    fomatted_transactions
  end

  def print_self
    puts "date || credit || debit || balance"
    statement_array.reverse.each do |formatted_transaction|
      puts formatted_transaction
    end
  end
  
end
